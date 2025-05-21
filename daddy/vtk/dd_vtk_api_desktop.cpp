/// @brief     Definition of vtk-api class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_api.hpp"
#if !DD_OS_WASM

// Dependencies
#include <vtk/dd_vtk_canvas.hpp>
#include <vtkDICOMDirectory.h>
#include <vtkDICOMMetaData.h>
#include <vtkDICOMReader.h>
#include <vtkSmartPointer.h>
#include <vtkStringArray.h>

namespace Daddy {

class dDicomP
{
public:
    static dDicomP* toClass(ptr_u handle)
    {return static_cast<dDicomP*>((void*) handle);}

public:
    vtkSmartPointer<vtkDICOMReader> mReader;
    std::map<std::string, std::string> mSpec;
};

dVtkApi::dDicom dVtkApi::openDicom(dLiteral dirpath)
{
    auto Sorter = vtkSmartPointer<vtkDICOMDirectory>::New();
    Sorter->RequirePixelDataOn();
    Sorter->SetScanDepth(1);
    Sorter->SetDirectoryName(dirpath.buildNative());
    Sorter->Update();

    int KMax = 0, SeriesIdx = 0;
    for(int i = 0, iend = Sorter->GetNumberOfStudies(); i < iend; ++i)
    {
        const int jFirst = Sorter->GetFirstSeriesForStudy(i);
        const int jLast = Sorter->GetLastSeriesForStudy(i);
        for(int j = jFirst; j <= jLast; ++j)
        {
            int k = Sorter->GetFileNamesForSeries(j)->GetNumberOfValues();
            if(k > KMax)
            {
                KMax = k;
                SeriesIdx = j;
            }
        }
    }

    auto NewDicomP = new dDicomP();
    vtkStringArray* Array = Sorter->GetFileNamesForSeries(SeriesIdx);
    NewDicomP->mReader = vtkSmartPointer<vtkDICOMReader>::New();
    NewDicomP->mReader->SetMemoryRowOrderToFileNative();
    NewDicomP->mReader->SetFileNames(Array);
    NewDicomP->mReader->UpdateInformation();
    NewDicomP->mReader->AutoRescaleOff();
    NewDicomP->mReader->Update();
    vtkDICOMReader* RefDicomReader = NewDicomP->mReader.Get();

    vtkDICOMMetaData* Meta = NewDicomP->mReader->GetMetaData();
    NewDicomP->mSpec["patient_id"] = Meta->Get(DC::PatientID).AsString().c_str();
    NewDicomP->mSpec["patient_name"] = Meta->Get(DC::PatientName).AsString().c_str();
    NewDicomP->mSpec["patient_sex"] = Meta->Get(DC::PatientSex).AsString().c_str();
    NewDicomP->mSpec["patient_age"] = Meta->Get(DC::PatientAge).AsString().c_str();
    NewDicomP->mSpec["image_count"] = Meta->Get(DC::CardiacNumberOfImages).AsString().c_str();
    NewDicomP->mSpec["series_count"] = Meta->Get(DC::NumberOfSeriesRelatedInstances).AsString().c_str();
    NewDicomP->mSpec["study_date"] = Meta->Get(DC::StudyDate).AsString().c_str();
    NewDicomP->mSpec["study_time"] = Meta->Get(DC::StudyTime).AsString().c_str();
    NewDicomP->mSpec["study_desc"] = Meta->Get(DC::StudyDescription).AsString().c_str();
    NewDicomP->mSpec["study_id"] = Meta->Get(DC::StudyID).AsString().c_str();
    NewDicomP->mSpec["study_uid"] = Meta->Get(DC::StudyInstanceUID).AsString().c_str();
    NewDicomP->mSpec["comment"] = Meta->Get(DC::AssertionComments).AsString().c_str();

    dVtkCanvas::passAll([RefDicomReader](utf8s wid, dVtkCanvas& canvas)->void
    {
        canvas.setDicom(RefDicomReader);
    });
    return dDicom((ptr_u) NewDicomP, [](ptr_u handle)->void {delete dDicomP::toClass(handle);});
}

dLiteral dVtkApi::dicomSpec(dDicom dicom, dLiteral key, dLiteral default_value)
{
    auto CurDicomP = dicom.get<dDicomP>();
    auto it = CurDicomP->mSpec.find(key.buildNative());
    if(it != CurDicomP->mSpec.end())
        return dString(it->second.c_str());
    return default_value;
}

} // namespace Daddy

#endif // !DD_OS_WASM

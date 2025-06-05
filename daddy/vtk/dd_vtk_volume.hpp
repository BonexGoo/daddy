/// @brief     Definition of vtk-volume class.
/// @license   MIT License
/// @author    BonexGoo
#pragma once

// Dependencies
#include <daddy.hpp>
#include <vector>

namespace Daddy {

/// @brief VTK볼륨객체
class dVtkVolume
{
public:
    static void setMainData(const dVtkVolume* data);
    static const dVtkVolume* getMainData();

public:
    static int getGraphMin();
    static int getGraphMax();
    static int getGraphRadius();
    static void setGraph(int min, int max, int radius);

public:
    dVtkVolume();
    ~dVtkVolume();

public:
    void load(const dLiteral& path);
    void save(const dLiteral& path);
    int addVolume(int minvalue, int maxvalue);
    int popupVolume(int idx);
    void deleteVolume(int idx);
    void setPopupColor(int r, int g, int b);
    void setPopupOpacity(double s, double g);
    void setPopupOk();
    void setPopupCancel();

private:
    void updateOneElement(int idx);
    void updateAllElements();

public:
    struct Element
    {
        int mMin {0};
        int mMax {0};
        int mColorR {128};
        int mColorG {128};
        int mColorB {128};
        double mOpacityScalar {0.5};
        double mOpacityGradient {0.5};
    };
    inline int getElementCount() const {return (int) mElements.size();}
    inline const Element* getElement(int idx) const {return &mElements[idx];}

private:
    std::vector<Element> mElements;
    int mPopupIdx {-1};
    int mOldColorR;
    int mOldColorG;
    int mOldColorB;
    double mOldOpacityScalar;
    double mOldOpacityGradient;

////////////////////////////////////////////////////////////////////////////////
// Dicom
public:
    inline void setPatientID(const dLiteral& value) const   {mLastPatientID = value;}
    inline void setPatientName(const dLiteral& value) const {mLastPatientName = value;}
    inline void setPatientSex(const dLiteral& value) const  {mLastPatientSex = value;}
    inline void setPatientAge(const dLiteral& value) const  {mLastPatientAge = value;}
    inline void setImageCount(const dLiteral& value) const  {mLastImageCount = value;}
    inline void setSeriesCount(const dLiteral& value) const {mLastSeriesCount = value;}
    inline void setStudyDate(const dLiteral& value) const   {mLastStudyDate = value;}
    inline void setStudyTime(const dLiteral& value) const   {mLastStudyTime = value;}
    inline void setStudyDesc(const dLiteral& value) const   {mLastStudyDesc = value;}
    inline void setStudyID(const dLiteral& value) const     {mLastStudyID = value;}
    inline void setStudyUID(const dLiteral& value) const    {mLastStudyUID = value;}
    inline void setComment(const dLiteral& value) const     {mLastComment = value;}
    inline const dString getPatientID() const               {return nullTest(mLastPatientID);}
    inline const dString getPatientName() const             {return nullTest(mLastPatientName);}
    inline const dString getPatientSex() const              {return nullTest(mLastPatientSex);}
    inline const dString getPatientAge() const              {return nullTest(mLastPatientAge);}
    inline const dString getImageCount() const              {return nullTest(mLastImageCount);}
    inline const dString getSeriesCount() const             {return nullTest(mLastSeriesCount);}
    inline const dString getStudyDate() const               {return nullTest(mLastStudyDate);}
    inline const dString getStudyTime() const               {return nullTest(mLastStudyTime);}
    inline const dString getStudyDesc() const               {return nullTest(mLastStudyDesc);}
    inline const dString getStudyID() const                 {return nullTest(mLastStudyID);}
    inline const dString getStudyUID() const                {return nullTest(mLastStudyUID);}
    inline const dString getComment() const                 {return nullTest(mLastComment);}

private:
    inline const dString nullTest(const dLiteral& text) const
    {return (text.length() == 0)? dLiteral("(null)") : text;}

private:
    mutable dString mLastPatientID;
    mutable dString mLastPatientName;
    mutable dString mLastPatientSex;
    mutable dString mLastPatientAge;
    mutable dString mLastImageCount;
    mutable dString mLastSeriesCount;
    mutable dString mLastStudyDate;
    mutable dString mLastStudyTime;
    mutable dString mLastStudyDesc;
    mutable dString mLastStudyID;
    mutable dString mLastStudyUID;
    mutable dString mLastComment;
};

} // namespace Daddy

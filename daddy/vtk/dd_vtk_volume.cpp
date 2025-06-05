/// @brief     Definition of vtk-volume class.
/// @license   MIT License
/// @author    BonexGoo
#include "dd_vtk_volume.hpp"

// Dependencies

namespace Daddy {

static const dVtkVolume* gMainData = nullptr;
static int gGraphMin = -1100;
static int gGraphMax = 20000;
static int gGraphRadius = 100;

void dVtkVolume::setMainData(const dVtkVolume* data)
{
    gMainData = data;
}

const dVtkVolume* dVtkVolume::getMainData()
{
    return gMainData;
}

int dVtkVolume::getGraphMin()
{
    return gGraphMin;
}

int dVtkVolume::getGraphMax()
{
    return gGraphMax;
}

int dVtkVolume::getGraphRadius()
{
    return gGraphRadius;
}

void dVtkVolume::setGraph(int min, int max, int radius)
{
    gGraphMin = min;
    gGraphMax = max;
    gGraphRadius = radius;
    dExternalDom::set("vol.graph.min", dString::fromNumber(gGraphMin));
    dExternalDom::set("vol.graph.max", dString::fromNumber(gGraphMax));
    dExternalDom::set("vol.graph.radius", dString::fromNumber(gGraphRadius));
}

dVtkVolume::dVtkVolume()
{
}

dVtkVolume::~dVtkVolume()
{
}

void dVtkVolume::load(const dLiteral& path)
{
    auto OneYamlFile = dBinary::fromFile(path);
    auto OneYamlText = dString::fromBinaryUTF8(OneYamlFile);
    const dMarkup Data(OneYamlText);
    mElements.clear();
    mPopupIdx = -1;

    for(int i = 0, iend = Data("elements").length(); i < iend; ++i)
    {
        DD_hook(Data("elements")[i])
        {
            Element NewElement;
            NewElement.mMin = DD_fish("min").get().toNumber();
            NewElement.mMax = DD_fish("max").get().toNumber();
            NewElement.mColorR = DD_fish("color")("r").get().toNumber();
            NewElement.mColorG = DD_fish("color")("g").get().toNumber();
            NewElement.mColorB = DD_fish("color")("b").get().toNumber();
            NewElement.mOpacityScalar = DD_fish("opacity")("scalar").get().toDouble();
            NewElement.mOpacityGradient = DD_fish("opacity")("gradient").get().toDouble();
            mElements.push_back(DD_rvalue(NewElement));
        }
    }
    updateAllElements();
}

void dVtkVolume::save(const dLiteral& path)
{
    dMarkup Data;
    for(int i = 0, iend = mElements.size(); i < iend; ++i)
    {
        DD_hook(Data.at("elements").atAdding())
        {
            auto& CurElement = mElements[i];
            DD_fish.at("min").set(dString::fromNumber(CurElement.mMin));
            DD_fish.at("max").set(dString::fromNumber(CurElement.mMax));
            DD_fish.at("color").at("r").set(dString::fromNumber(CurElement.mColorR));
            DD_fish.at("color").at("g").set(dString::fromNumber(CurElement.mColorG));
            DD_fish.at("color").at("b").set(dString::fromNumber(CurElement.mColorB));
            DD_fish.at("opacity").at("scalar").set(dString::fromDouble(CurElement.mOpacityScalar));
            DD_fish.at("opacity").at("gradient").set(dString::fromDouble(CurElement.mOpacityGradient));
        }
    }

    auto NewYamlText = Data.saveYaml();
    auto NewYamlFile = NewYamlText.toBinaryUTF8(false);
    NewYamlFile.toFile(path, true);
}

int dVtkVolume::addVolume(int minvalue, int maxvalue)
{
    if(mPopupIdx == -1)
    {
        int InsertIdx = 0;
        for(int i = 0, iend = mElements.size(); i < iend; ++i)
        {
            auto& CurElement = mElements[i];
            // 좌측에 치우친 영역
            if(CurElement.mMax <= minvalue)
                InsertIdx++;
            // 좌측에 걸친 영역(우측잘림)
            else if(CurElement.mMin < minvalue)
            {
                InsertIdx++;
                CurElement.mMax = minvalue;
            }
            // 우측에 치우친 영역
            else if(maxvalue <= CurElement.mMin)
                break;
            // 우측에 걸친 영역(좌측잘림)
            else if(maxvalue < CurElement.mMax)
                CurElement.mMin = maxvalue;
            // 가운데에 포함되어서 삭제
            else
            {
                mElements.erase(mElements.begin() + i);
                i--;
                iend--;
            }
        }

        Element NewElement;
        NewElement.mMin = minvalue;
        NewElement.mMax = maxvalue;
        // 팝업정보 기록
        mPopupIdx = InsertIdx;
        mOldColorR = NewElement.mColorR;
        mOldColorG = NewElement.mColorG;
        mOldColorB = NewElement.mColorB;
        mOldOpacityScalar = NewElement.mOpacityScalar;
        mOldOpacityGradient = NewElement.mOpacityGradient;
        mElements.insert(mElements.begin() + InsertIdx, DD_rvalue(NewElement));
        updateAllElements();
    }
    return mPopupIdx;
}

int dVtkVolume::popupVolume(int idx)
{
    if(mPopupIdx == -1)
    {
        mPopupIdx = __max(0, __min(idx, mElements.size() - 1));
        auto& CurElement = mElements[mPopupIdx];
        mOldColorR = CurElement.mColorR;
        mOldColorG = CurElement.mColorG;
        mOldColorB = CurElement.mColorB;
        mOldOpacityScalar = CurElement.mOpacityScalar;
        mOldOpacityGradient = CurElement.mOpacityGradient;
    }
    return mPopupIdx;
}

void dVtkVolume::deleteVolume(int idx)
{
    if(mPopupIdx == -1)
    {
        mElements.erase(mElements.begin() + idx);
        updateAllElements();
    }
}

void dVtkVolume::setPopupColor(int r, int g, int b)
{
    if(mPopupIdx != -1)
    {
        auto& CurElement = mElements[mPopupIdx];
        CurElement.mColorR = r;
        CurElement.mColorG = g;
        CurElement.mColorB = b;
        updateOneElement(mPopupIdx);
    }
}

void dVtkVolume::setPopupOpacity(double s, double g)
{
    if(mPopupIdx != -1)
    {
        auto& CurElement = mElements[mPopupIdx];
        CurElement.mOpacityScalar = s;
        CurElement.mOpacityGradient = g;
        updateOneElement(mPopupIdx);
    }
}

void dVtkVolume::setPopupOk()
{
    if(mPopupIdx != -1)
        mPopupIdx = -1;
}

void dVtkVolume::setPopupCancel()
{
    if(mPopupIdx != -1)
    {
        auto& CurElement = mElements[mPopupIdx];
        CurElement.mColorR = mOldColorR;
        CurElement.mColorG = mOldColorG;
        CurElement.mColorB = mOldColorB;
        CurElement.mOpacityScalar = mOldOpacityScalar;
        CurElement.mOpacityGradient = mOldOpacityGradient;
        updateOneElement(mPopupIdx);
    }
    setPopupOk();
}

void dVtkVolume::updateOneElement(int idx)
{
    const dString Header = dString::print("vol.data.%d", idx);
    auto& CurElement = mElements[idx];
    dExternalDom::set(Header + ".min", dString::fromNumber(CurElement.mMin));
    dExternalDom::set(Header + ".max", dString::fromNumber(CurElement.mMax));
    dExternalDom::set(Header + ".color.r", dString::fromNumber(CurElement.mColorR));
    dExternalDom::set(Header + ".color.g", dString::fromNumber(CurElement.mColorG));
    dExternalDom::set(Header + ".color.b", dString::fromNumber(CurElement.mColorB));
    dExternalDom::set(Header + ".opacity.scalar", dString::fromDouble(CurElement.mOpacityScalar));
    dExternalDom::set(Header + ".opacity.gradient", dString::fromDouble(CurElement.mOpacityGradient));
}

void dVtkVolume::updateAllElements()
{
    dExternalDom::remove("vol.data.");
    for(int i = 0, iend = mElements.size(); i < iend; ++i)
        updateOneElement(i);
    dExternalDom::set("vol.data.count", dString::fromNumber(mElements.size()));
}

} // namespace Daddy

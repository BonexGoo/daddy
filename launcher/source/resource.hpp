#pragma once
#include <element/boss_image.hpp>

namespace BOSS
{
    class R
    {
    public:
        R(chars name);
        ~R();

    public:
        static const sint32 IconSize = 40;
        static const sint32 WidgetGap = 8;
        static const sint32 WidgetWidthMin = 250;
        static const sint32 WidgetHeight = WidgetGap + 90;
        static const sint32 ButtonWidth = 60;
        static const sint32 ButtonHeight = 30;
        static const sint32 SubButtonWidth = 75;
        static const sint32 SubButtonHeight = 25;
        static const sint32 TitleHeight = 22;
        static const sint32 CommentHeight = 26;
        static const Color WidgetColor[2];

    public:
        static void SetAtlasDir(chars dirname);
        static void AddAtlas(chars key_filename, chars map_filename, const Context& ctx);
        static void SaveAtlas(Context& ctx);
        static bool IsAtlasUpdated();
        static void RebuildAll();

    public:
        inline bool exist() const {return mExist;}
        inline sint32 w() const {return (mImage)? mImage->GetWidth() : 0;}
        inline sint32 h() const {return (mImage)? mImage->GetHeight() : 0;}

    public:
        inline operator const Image&() const
        {
            BOSS_ASSERT("이미지가 로드되지 않았습니다", mImage);
            return *mImage;
        }
        inline const Image* operator->() const
        {
            BOSS_ASSERT("이미지가 로드되지 않았습니다", mImage);
            return mImage;
        }

    private:
        Image* mImage;
        bool mExist;
    };
}

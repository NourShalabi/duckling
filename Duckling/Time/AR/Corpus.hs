-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.


{-# LANGUAGE OverloadedStrings #-}

module Duckling.Time.AR.Corpus
  ( corpus
  , negativeCorpus
  ) where

import Data.String
import Prelude

import Duckling.Locale
import Duckling.Resolve
import Duckling.Time.Corpus
import Duckling.Time.Types hiding (Month)
import Duckling.TimeGrain.Types hiding (add)
import Duckling.Testing.Types hiding (examples)

context :: Context
context = testContext {locale = makeLocale AR Nothing}

corpus :: Corpus
corpus = (context, testOptions, allExamples)

negativeCorpus :: NegativeCorpus
negativeCorpus = (context, testOptions, examples)
  where
    examples =
      [ "حب"
      ]

allExamples :: [Example]
allExamples = concat
  [ examples (datetime (2013, 2, 12, 4, 30, 0) Second)
             [ "حالا"
             , "الان"
             , "في هذه اللحظة"
             ]
  , examples (datetime (2013, 2, 12, 0, 0, 0) Day)
             [ "اليوم"
             , "في هذا اليوم"
             ]
  , examples (datetime (2013, 2, 1, 0, 0, 0) Day)
             [ "2/2013"
             , "الاول من شهر شباط"
             , "الاول من شباط"
             , "في اول شباط"
             ]
  , examples (datetime (2013, 2, 11, 0, 0, 0) Day)
             [ "امس"
             , "البارحة"
             , "اليوم الماضي"
             , "اليوم السابق"
             , "اليوم المنصرم"
             ]
  , examples (datetime (2013, 2, 13, 0, 0, 0) Day)
             [ "غدا"
             , "بكرة"
             , "يوم غد"
             , "بكرا"
             ]
  , examples (datetime (2013, 2, 18, 0, 0, 0) Day)
             [ "الاثنين"
             , "هذا الاثنين"
             , "يوم الاثنين في 18 شباط"
             , "الاثنين 18 شباط"
             ]
  , examples (datetime (2013, 2, 19, 0, 0, 0) Day)
             [ "الثلاثاء"
             , "الثلاثاء التاسع عشر من هذا الشهر"
             ]
  , examples (datetime (2013, 2, 15, 0, 0, 0) Day)
             [ "الجمعة"
             , "الجمعه"
             , "يوم الجمعة 15 شباط"
             ]
  , examples (datetime (2013, 8, 15, 0, 0, 0) Day)
             [ "الخميس 15 اغسطس"
             ]
  , examples (datetime (2013, 2, 14, 0, 0, 0) Day)
             [ "الخميس"
             , "الخميس الموافق 14 شهر شباط"
             ]
  , examples (datetime (2013, 2, 16, 0, 0, 0) Day)
             [ "السبت"
             , "السبت السادس عشر"
             ]
  , examples (datetime (2013, 2, 17, 0, 0, 0) Day)
             [ "الاحد"
             , "الأحد السابع عشرة"
             ]
  , examples (datetime (2013, 3, 15, 0, 0, 0) Day)
             [ "نص شهر ثلاث"
             , "منتصف اذار"
             , "في نصف شهر مارس"
             ]
  , examples (datetime (2013, 3, 1, 0, 0, 0) Day)
             [ "الاول من اذار"
             , "1 مارس"
             , "في الاول من مارس"
             , "اليوم الاول من شهر ثلاثة"
             , "بداية شهر 3"
             ]
  , examples (datetime (2013, 4, 4, 0, 0, 0) Day)
             [ "الرابع من ابريل"
             , "الرابع من نيسان"
             , "4 ابريل"
             ]
  , examples (datetime (2013, 2, 19, 0, 0, 0) Day)
             [ "الثلاثاء القادم"
             , "قرابة الثلاثاء القادم"
             ]
  , examples (datetime (2013, 2, 13, 0, 0, 0) Day)
             [ "الاربعاء، 13 شباط"
             , "الثالث عشرة من شباط"
             , "الاربعاء الموافق الثالث عشر من شباط 2013"
             ]
  , examples (datetime (2013, 2, 4, 0, 0, 0) Week)
             [ "الاسبوع الماضي"
             , "الاسبوع السابق"
             , "الاسبوع المنصرم"
             ]
  , examples (datetime (2013, 2, 5, 0, 0, 0) Day)
             [ "قبل اسبوع"
             , "من اسبوع"
             ]
  , examples (datetime (2013, 2, 11, 0, 0, 0) Week)
             [ "هذا الاسبوع"
             , "الاسبوع الحالي"
             ]
  , examples (datetime (2013, 2, 18, 0, 0, 0) Week)
             [ "الاسبوع القادم"
             , "الاسبوع التالي"
             , "الاسبوع المقبل"
             , "الاسبوع الجاي"
             ]
  , examples (datetime (2013, 1, 1, 0, 0, 0) Month)
             [ "الشهر الماض" ]
  , examples (datetime (2013, 3, 1, 0, 0, 0) Month)
             [ "الشهر التالي" ]
  , examples (datetime (2012, 1, 1, 0, 0, 0) Year)
             [ "السنة السابقة" ]
  , examples (datetime (2014, 1, 1, 0, 0, 0) Year)
             [ "السنة القادمة" ]
  , examples (datetime (2013, 1, 1, 0, 0, 0) Year)
             [ "السنة الحالية"
             , "هذه السنة"
             ]
  , examples (datetime (2013, 2, 10, 0, 0, 0) Day)
             [ "الاحد الماضي"
             , "احد الاسبوع الماضي"
             , "الاحد من الاسبوع الماضي"
             ]
  , examples (datetime (2013, 2, 11, 0, 0, 0) Day)
             [ "اثنين الاسبوع الحالي"
             , "الاثنين من هذا الاسبوع"
             ]
  , examples (datetime (2013, 2, 5, 0, 0, 0) Day)
             [ "الثلاثاء الماضي"
             , "يوم الثلاثاء السابق"
             , "ثلاثاء الاسبوع الفائت"
             ]
  , examples (datetime (2013, 2, 14, 0, 0, 0) Day)
             [ "يوم بعد غد"
             , "اليوم الذي بعد الغد"
             , "اليوم الي بعد بكرة"
             ]
  , examples (datetime (2013, 2, 10, 0, 0, 0) Day)
             [ "يوم قبل امس"
             , "اليوم القبل البارحة"
             , "اليوم الي قبل امبارح"
             ]
  , examples (datetime (2013, 3, 25, 0, 0, 0) Day)
             [ "اخر اثنين من شهر اذار"
             , "الاثنين الاخير من شهر ثلاثة"
             , "اخر اثنين من الشهر القادم"
             ]
  , examples (datetime (2014, 3, 25, 0, 0, 0) Day)
             [ "الثلاثاء الاخير من شهر مارس السنة القادمة" ]
  , examples (datetime (2013, 10, 3, 0, 0, 0) Day)
             [ "اليوم الثالث من اكتوبر"
             , "اليوم الثالث من شهر عشرة"
             , "ثالث يوم من شهر عشرة"
             ]
  , examples (datetime (2014, 10, 6, 0, 0, 0) Week)
             [ "اول اسبوع بشهر اكتوبر 2014"
             , "الاسبوع الاول من شهر عشرة 2014"
             ]
  , examples (datetime (2015, 10, 31, 0, 0, 0) Day)
             [ "اخر يوم بشهر عشرة سنة 2015"
             , "اليوم الاخير من شهر عشرة سنة 2015"
             ]
  , examples (datetime (2014, 9, 22, 0, 0, 0) Week)
             [ "اخر اسبوع في سبتمبر لعام 2014"
             , "الاسبوع الاخير في الشهر التاسع سنة 2014"
             ]
  , examples (datetime (2013, 10, 1, 0, 0, 0) Day)
             [ "اول ثلاثاء من شهر عشرة"
             , "الثلاثاء الأولى من اكتوبر"
             , "الثلاثا الاول من شهر تشرين الاول"
             ]
  , examples (datetime (2014, 9, 16, 0, 0, 0) Day)
             [ "الثلاثاء الثالث من شهر ايلول من عام 2014"
             , "ثالث يوم ثلاثاء بايلول بعام 2014"
             , "ثالث ثلاثاء في ايلول في سنة 2014"
             ]
  , examples (datetime (2014, 10, 8, 0, 0, 0) Day)
             [ "ثاني اربعاء من شهر اكتوبر من عام 2014"
             , "ثان اربعا في اكتوبر لعام 2014"
             , "الاربعاء الثانية من شهر اكتوبر في سنة 2014"
             ]
  , examples (datetime (2015, 1, 13, 0, 0, 0) Day)
             [ "ثالث ثلاثاء بعد كريسماس 2014"
             ]
  , examples (datetime (2013, 2, 12, 3, 0, 0) Hour)
             [ "الساعة 3 صباحا"
             , "الساعة ثلاثة الصبح"
             , "عند الساعة الثالثة صباحا"
             , "الساعة 3 الفجر"
             , "الثالثة فجرا"
             ]
  , examples (datetime (2013, 2, 12, 3, 18, 0) Minute)
             [ "3:18 صباحا"
             , "الساعة ثلاثة وثمانية عشرة دقيقة صباحا"
             , "الساعة الثالثة و18 دقيقة الصبح"
             , "الساعة 3 و 18 دقيقة صباحا"
             , "عند الثالثة وثمانية عشر دقيقة صباحا"
             ]
  , examples (datetime (2013, 2, 12, 15, 0, 0) Hour)
             [ "الساعة الثالثة عصرا"
             , "بحدود الساعة الثالثة"
             , "حوالي الساعة 3"
             , "الساعة 3 بعد الظهر"
             , "الساعة 3 عصرا"
             , "الساعة 3 العصر"
             ]
  , examples (datetime (2013, 2, 12, 15, 15, 0) Minute)
             [ "الساعة 3 و15 دقيقة عصرا"
             , "الساعة الثالثة وربع العصر"
             , "الثالثة وربع بعد الظهر"
             , "15:15"
             , "الساعة الثالثة وخمسة عشر دقيقة عصرا"
             ]
  , examples (datetime (2013, 2, 12, 15, 20, 0) Minute)
             [ "الساعة ثلاثة وثلث مساءا"
             , "3:20 عصرا"
             ]
  , examples (datetime (2013, 2, 12, 12, 30, 0) Minute)
             [ "الساعة الثانية عشرة ونصف ظهرا"
             , "12:30"
             , "12:30 ظهرا"
             ]
  , examples (datetime (2013, 2, 12, 15, 23, 24) Second)
             [ "15:23:24"
             ]
  , examples (datetime (2013, 2, 12, 11, 45, 0) Minute)
             [ "الساعة 11:45 قبل الظهر"
             , "الساعة 12 الا ربع قبل الظهر"
             , "الساعة الحادية عشر وخمس واربعون دقيقة صباحا"
             , "الساعة الثانية عشر إلا ربعا هذا الصباح"
             ]
  , examples (datetime (2013, 2, 12, 16, 40, 0) Minute)
             [ "الساعة الخامسة الا ثلث بعد العصر"
             , "الساعة خمسة إلا ثلث قبل المغرب"
             , "الساعة الرابعة واربعون دقيقة بعد العصر"
             ]
  , examples (datetime (2013, 2, 12, 20, 0, 0) Hour)
             [ "الساعة 8 بعد المغرب"
             , "الساعة 8 العشاء"
             , "الثامنة هذه الليلة"
             ]
  , examples (datetime (2013, 2, 14, 6, 0, 0) Minute)
             [ "الخميس الساعة 8 بتوقيت GMT"
             , "الخميس الساعة 8 بتوقيت gmt"
             ]
  , examples (datetime (2013, 9, 21, 13, 30, 0) Minute)
             [ "يوم السبت 21/09 الساعة 1:30 بعد الظهر"
             ]
  , examples (datetime (2013, 2, 12, 4, 23, 0) Minute)
             [ "الساعة الرابعة وثلاث وعشرون دقيقة فجرا"
             , "الساعة 4:23 الصبح"
             ]
  , examples (datetimeInterval ((2013, 3, 1, 0, 0, 0), (2013, 3, 11, 0, 0, 0)) Day)
             [ "في اوائل اذار"
             , "في أوائل شهر مارس"
             ]
  , examples (datetimeInterval ((2013, 3, 21, 0, 0, 0), (2013, 4, 1, 0, 0, 0)) Day)
             [ "في اواخر اذار"
             , "في أواخر شهر مارس"
             ]
  , examples (datetimeInterval ((2013, 2, 18, 0, 0, 0), (2013, 3, 11, 0, 0, 0)) Week)
             [ "الاسابيع الثلاثة القادمة"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 15, 0, 0), (2013, 2, 12, 17, 0, 0)) Hour)
             [ "من الساعة 3 الى الساعة 4 بعد العصر"
             , "من الساعة الثالثة الى الساعة الرابعة مساءا"
             ]
  , examples (datetimeInterval ((2013, 2, 14, 9, 0, 0), (2013, 2, 14, 12, 0, 0)) Hour)
             [ "الخميس من الساعة التاسعة وحتى الساعة الحادية عشرة صباحا"
             ]
  , examples (datetimeInterval ((2013, 7, 13, 0, 0, 0), (2013, 7, 16, 0, 0, 0)) Day)
             [ "يوليو 13-15"
             , "تموز 13 الى 15"
             , "13 الى 15 تموز"
             , "من 13 تموز الى 15 تموز"
             , "من 13 الى 15 يوليو"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 0), (2013, 2, 12, 14, 0, 0)) Second)
             [ "حتى الساعة 2:00"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 18, 0, 0), (2013, 2, 13, 0, 0, 0)) Hour)
             [ "هذه الليلة"
             , "الليلة"
             ]
  , examples (datetimeInterval ((2013, 2, 12, 4, 30, 0), (2013, 2, 26, 0, 0, 0)) Second)
             [ "خلال اسبوعين"
             ]
  , examples (datetimeInterval ((2013, 9, 1, 0, 0, 0), (2013, 9, 9, 0, 0, 0)) Day)
             [ "من 1-8 شهر ايلول"
             ]
  , examples (datetimeInterval ((2013, 10, 23, 0, 0, 0), (2013, 10, 27, 0, 0, 0)) Day)
             [ "من الثالث والعشرون وحتى السادس والعشرين من شهر اكتوبر"
             ]
  , examples (datetimeInterval ((2013, 8, 27, 0, 0, 0), (2013, 8, 30, 0, 0, 0)) Day)
             [ "اغسطس 27 الى 29"
             , "من 27-29 من الشهر الثامن"
             ]

  ]

* Encoding: UTF-8.

*Check for participants that did not pass an attention check or do not fit demographic criteria.

COMPUTE attentioncode = 0.
IF(Social_Comparisons_9 ~= 4) attentioncode = 1.
IF(Instagram_Check < 3) attentioncode = 1.
IF(Computer_Check ~= 1) attentioncode = 1.
IF(Age_1 > 25) attentioncode = 1.
EXECUTE.

ADD VALUE LABELS attentioncode 0 'Good attention' 1 'Check this participant'.

FREQUENCIES VARIABLES=Social_Comparisons_9 Instagram_Check Computer_Check Age_1 attentioncode
  /ORDER=ANALYSIS.

MEANS Social_Comparisons_9 BY attentioncode
/CELLS MIN MAX MEAN STDDEV.

MEANS Instagram_Check BY attentioncode
/CELLS MIN MAX MEAN STDDEV.

MEANS Computer_Check BY attentioncode
/CELLS MIN MAX MEAN STDDEV.

MEANS Age_1 BY attentioncode
/CELLS MIN MAX MEAN STDDEV.

SELECT IF(attentioncode = 0).
EXECUTE.

COMPUTE attentiondiscrete = 0.
IF(Check_2 ~= 3) attentiondiscrete = 1.
IF(Check_3 ~= 2) attentiondiscrete = 1.
IF(Nature_Qs_1 ~= 1) attentiondiscrete = 1.
IF(Nature_Qs_2 ~= 2) attentiondiscrete = 1.
IF(Nature_Qs_3 ~= 1) attentiondiscrete = 1.
EXECUTE.

ADD VALUE LABELS attentiondiscrete 0 'Good attention' 1 'Check this participant'.

FREQUENCIES VARIABLES=Check_2 Check_3 Nature_Qs_1 Nature_Qs_2 Nature_Qs_3 attentiondiscrete
  /ORDER=ANALYSIS.

MEANS Check_2 BY attentiondiscrete
/CELLS MIN MAX MEAN STDDEV.

MEANS Check_3 BY attentiondiscrete
/CELLS MIN MAX MEAN STDDEV.

MEANS Nature_Qs_1 BY attentiondiscrete
/CELLS MIN MAX MEAN STDDEV.

MEANS Nature_Qs_2 BY attentiondiscrete
/CELLS MIN MAX MEAN STDDEV.

MEANS Nature_Qs_3 BY attentiondiscrete
/CELLS MIN MAX MEAN STDDEV.

SELECT IF(attentiondiscrete = 0).
EXECUTE.

*Assigns IDs to participants after data is clean

COMPUTE ID=$CASENUM.
EXECUTE.

*Variables are recoded and aggregated

COMPUTE Awe_Total = MEAN.6(DPES_1, DPES_2, DPES_3, DPES_4, DPES_5, DPES_6).
EXECUTE.

COMPUTE Positive_Affect = SUM.10(PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, PANAS_19).
EXECUTE.

COMPUTE Negative_Affect = SUM.10(PANAS_2, PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20).
EXECUTE.

RECODE Loneliness_1 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Loneliness_1_Recoded.
EXECUTE. 

RECODE Loneliness_2 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Loneliness_2_Recoded.
EXECUTE. 

RECODE Loneliness_4 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Loneliness_4_Recoded.
EXECUTE. 

RECODE Loneliness_5 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Loneliness_5_Recoded.
EXECUTE. 

RECODE Loneliness_7 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Loneliness_7_Recoded.
EXECUTE. 

RECODE Loneliness_8 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Loneliness_8_Recoded.
EXECUTE. 

COMPUTE Loneliness_Total = SUM.8(Loneliness_1_Recoded, Loneliness_2_Recoded, Loneliness_3, Loneliness_4_Recoded, Loneliness_5_Recoded, Loneliness_6, Loneliness_7_Recoded, Loneliness_8_Recoded). 
EXECUTE.

RECODE Social_Comparisons_6 (1 = 5) (2 = 4) (3 = 3) (4 = 2)(5 = 1) INTO Social_Comparisons_6_Recoded.
EXECUTE.

RECODE Social_Comparisons_11 (1 = 5) (2 = 4) (3 = 3) (4 = 2)(5 = 1) INTO Social_Comparisons_11_Recoded.
EXECUTE. 

COMPUTE Social_Comparisons_Total = MEAN.11(Social_Comparisons_1, Social_Comparisons_2, Social_Comparisons_3, Social_Comparisons_4, Social_Comparisons_5, Social_Comparisons_6_Recoded,
 Social_Comparisons_7, Social_Comparisons_8, Social_Comparisons_10, Social_Comparisons_11_Recoded, Social_Comparisons_12).
EXECUTE.

RECODE Depression_4 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Depression_4_Recoded.
EXECUTE.

RECODE Depression_8 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Depression_8_Recoded.
EXECUTE.

RECODE Depression_12 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Depression_12_Recoded.
EXECUTE.

RECODE Depression_16 (1 = 4) (2 = 3) (3 = 2) (4 = 1) INTO Depression_16_Recoded.
EXECUTE.

COMPUTE Depression_Total = SUM.20(Depression_1, Depression_2,  Depression_3,  Depression_4_Recoded,  Depression_5,  Depression_6,  Depression_7,  Depression_8_Recoded,  Depression_9, Depression_10, 
Depression_11,  Depression_12_Recoded,  Depression_13, Depression_14, Depression_15, Depression_16_Recoded, Depression_17, Depression_18, Depression_19, Depression_20). 
EXECUTE.

COMPUTE FSI_Relatedness = MEAN.2(FSI_Similar, FSI_Connected).
EXECUTE.

COMPUTE FSI_Positivity = MEAN.2(FSI_Positivity1, FSI_Positivity2).
EXECUTE.

COMPUTE FSI_Vividness = MEAN.2(FSI_Vividness1, FSI_Vividness2).
EXECUTE.

COMPUTE Affect_Total = SUM.20(PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, PANAS_19, 
PANAS_2, PANAS_4,PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20).
EXECUTE.

RECODE Religion (1 = 1) (2 = 1) (3 = 2) (4 = 2) INTO Religion_Recoded.
VARIABLE LABELS  Religion_Recoded 'Describes religious affiliation'.
ADD VALUE LABELS Religion_Recoded 1 'Not_Religious' 2 'Religious'.
EXECUTE.

COMPUTE FSI_Total = MEAN.7(FSI_Similar, FSI_Connected, FSI_Positivity1, FSI_Positivity2, FSI_Vividness1, FSI_Vividness2, FSI_Certainty).
EXECUTE.

RECODE Group ('Nature'=1) ('Social_Media'=2) ('SM_N'=3) INTO Condition.
VARIABLE LABELS  Condition 'Experimental manipulation'.
ADD VALUE LABELS Condition 1 'Nature' 2 'Social_Media' 3 'SM_N'.
EXECUTE.

*Frequencies, Normality and Descriptives of all variables; used to create descriptives tables, scales, and correlation table

FREQUENCIES VARIABLES=Age_1 Education_Level Sex Race SES Religion_Recoded
  /ORDER=ANALYSIS.

DESCRIPTIVES VARIABLES=Age_1 Education_Level Sex Race SES Religion_Recoded
  /STATISTICS=MEAN STDDEV MIN MAX.

EXAMINE VARIABLES=Positive_Affect Negative_Affect Awe_Total Loneliness_Total Social_Comparisons_Total Depression_Total FSI_Certainty 
  FSI_Relatedness FSI_Positivity FSI_Vividness Affect_Total Religion_Recoded
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING PAIRWISE
  /NOTOTAL.

DESCRIPTIVES VARIABLES=Positive_Affect Negative_Affect Awe_Total Loneliness_Total Social_Comparisons_Total Depression_Total FSI_Certainty FSI_Relatedness 
  Affect_Total FSI_Positivity FSI_Vividness FSI_Total Time_Outside SM_Use1 Religion_Recoded
  /STATISTICS=MEAN STDDEV MIN MAX KURTOSIS SKEWNESS.

CORRELATIONS
   /VARIABLES=Positive_Affect Negative_Affect Awe_Total Loneliness_Total Social_Comparisons_Total Depression_Total FSI_Certainty FSI_Relatedness 
   FSI_Positivity FSI_Vividness Time_Outside SM_Use1 Religion_Recoded
   /PRINT=TWOTAIL NOSIG
   /MISSING=PAIRWISE.

*Factor Analysis; only performed to check and make sure nothing is weird about the data. Not part of the main hypotheses as all scales are previously validated. 

FACTOR
 /VARIABLES DPES_1, DPES_2, DPES_3, DPES_4, DPES_5, DPES_6
 /MISSING LISTWISE 
  /ANALYSIS DPES_1, DPES_2, DPES_3, DPES_4, DPES_5, DPES_6
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, PANAS_19, PANAS_2,
 PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20
 /MISSING LISTWISE 
  /ANALYSIS PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, PANAS_19, PANAS_2,
 PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, PANAS_19
 /MISSING LISTWISE 
  /ANALYSIS PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, PANAS_19
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES PANAS_2,
 PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20
 /MISSING LISTWISE 
  /ANALYSIS PANAS_2, PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES Depression_1 Depression_2 Depression_3 Depression_4 Depression_5 Depression_6 
    Depression_7 Depression_8 Depression_9 Depression_10 Depression_11 Depression_12 Depression_13 
    Depression_14 Depression_15 Depression_16 Depression_17 Depression_18 Depression_19 Depression_20
  /MISSING LISTWISE 
  /ANALYSIS Depression_1 Depression_2 Depression_3 Depression_4 Depression_5 Depression_6 
    Depression_7 Depression_8 Depression_9 Depression_10 Depression_11 Depression_12 Depression_13 
    Depression_14 Depression_15 Depression_16 Depression_17 Depression_18 Depression_19 Depression_20
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES Loneliness_1_Recoded, Loneliness_2_Recoded, Loneliness_3, Loneliness_4_Recoded, Loneliness_5_Recoded, Loneliness_6, Loneliness_7_Recoded, Loneliness_8_Recoded
 /MISSING LISTWISE 
  /ANALYSIS Loneliness_1_Recoded, Loneliness_2_Recoded, Loneliness_3, Loneliness_4_Recoded, Loneliness_5_Recoded, Loneliness_6, Loneliness_7_Recoded, Loneliness_8_Recoded
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES Social_Comparisons_1, Social_Comparisons_2, Social_Comparisons_3, Social_Comparisons_4, Social_Comparisons_5, Social_Comparisons_6_Recoded,
 Social_Comparisons_7, Social_Comparisons_8, Social_Comparisons_10, Social_Comparisons_11_Recoded, Social_Comparisons_12
 /MISSING LISTWISE 
  /ANALYSIS Social_Comparisons_1, Social_Comparisons_2, Social_Comparisons_3, Social_Comparisons_4, Social_Comparisons_5, Social_Comparisons_6_Recoded,
 Social_Comparisons_7, Social_Comparisons_8, Social_Comparisons_10, Social_Comparisons_11_Recoded, Social_Comparisons_12
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES FSI_Similar, FSI_Connected, FSI_Positivity1, FSI_Positivity2, FSI_Vividness1, FSI_Vividness2, FSI_Certainty
 /MISSING LISTWISE 
  /ANALYSIS FSI_Similar, FSI_Connected, FSI_Positivity1, FSI_Positivity2, FSI_Vividness1, FSI_Vividness2, FSI_Certainty
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

FACTOR
 /VARIABLES SM_Use1 SM_Use2
 /MISSING LISTWISE 
  /ANALYSIS SM_Use1 SM_Use2
  /PRINT INITIAL CORRELATION EXTRACTION ROTATION
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25) DELTA(0)
  /ROTATION OBLIMIN
  /METHOD=CORRELATION.

*Check reliability and get the cronbach's alpha of all measures

RELIABILITY
  /VARIABLES=Depression_1 Depression_2 Depression_3 Depression_4 Depression_5 Depression_6 
    Depression_7 Depression_8 Depression_9 Depression_10 Depression_11 Depression_12 Depression_13 
    Depression_14 Depression_15 Depression_16 Depression_17 Depression_18 Depression_19 Depression_20
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=DPES_1, DPES_2, DPES_3, DPES_4, DPES_5, DPES_6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, 
  PANAS_19, PANAS_2, PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=PANAS_1, PANAS_3, PANAS_5, PANAS_9, PANAS_10, PANAS_12, PANAS_14, PANAS_16, PANAS_17, 
  PANAS_19
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=PANAS_2, PANAS_4, PANAS_6, PANAS_7, PANAS_8, PANAS_11, PANAS_13, PANAS_15, PANAS_18, PANAS_20
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=Loneliness_1_Recoded, Loneliness_2_Recoded, Loneliness_3, Loneliness_4_Recoded, Loneliness_5_Recoded, Loneliness_6, Loneliness_7_Recoded, Loneliness_8_Recoded
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=Social_Comparisons_1, Social_Comparisons_2, Social_Comparisons_3, Social_Comparisons_4, Social_Comparisons_5, Social_Comparisons_6_Recoded,
 Social_Comparisons_7, Social_Comparisons_8, Social_Comparisons_10, Social_Comparisons_11_Recoded, Social_Comparisons_12
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=FSI_Similar, FSI_Connected, FSI_Positivity1, FSI_Positivity2, FSI_Vividness1, FSI_Vividness2, FSI_Certainty
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=FSI_Similar, FSI_Connected
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=FSI_Positivity1, FSI_Positivity2
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

RELIABILITY
  /VARIABLES=FSI_Vividness1, FSI_Vividness2
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR COV
  /SUMMARY=TOTAL MEANS VARIANCE
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.

*Split histograms are used to check for normality and heterogeneity

GRAPH
  /HISTOGRAM=Positive_Affect
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=Negative_Affect
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=Awe_Total
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=Loneliness_Total
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=Social_Comparisons_Total
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=FSI_Certainty
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=FSI_Relatedness
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=FSI_Positivity
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=FSI_Vividness
  /PANEL ROWVAR=Condition ROWOP=CROSS.

GRAPH
  /HISTOGRAM=Depression_Total
  /PANEL ROWVAR=Condition ROWOP=CROSS.

*Means tables by group; used to add descriptive statistics to check for reliability within each group and create a detailed ANOVA table.

MEANS TABLES=Positive_Affect BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=Negative_Affect BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=Awe_Total BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=Loneliness_Total BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=Social_Comparisons_Total BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=FSI_Certainty BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=FSI_Relatedness BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=FSI_Positivity BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=FSI_Vividness BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

MEANS TABLES=Depression_Total BY Condition
  /CELLS=MEAN COUNT STDDEV MIN MAX.

* Encoding: UTF-8.
*We will be using a oneway ANOVA procedure. DV by IV. The request is for descriptive statistics (sum of squares, df, MS, F values for between, within, and total).
*Tukey's HSD is used to perform a post-hoc test.

ONEWAY FSI_Certainty FSI_Relatedness FSI_Positivity FSI_Vividness Depression_Total Social_Comparisons_Total Loneliness_Total Negative_Affect 
    Positive_Affect Awe_Total BY Condition
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=TUKEY ALPHA(0.05).

*Univariate ANOVA is performed to find the partial eta squared, or effect size.

UNIANOVA FSI_Certainty FSI_Relatedness FSI_Positivity FSI_Vividness Depression_Total Social_Comparisons_Total Loneliness_Total Negative_Affect 
    Positive_Affect Awe_Total BY Condition
/METHOD=SSTYPE(3)
/INTERCEPT=INCLUDE
/PRINT=ETASQ
/CRITERIA=ALPHA(.05)
/DESIGN=Condition.

*PROCESS code is not here because it takes up so much space to paste. Output from process that was used for graphs is provided. Religion_Recoded, Time_Outside, and SM_Use1 are used as potential moderators.

DATA LIST FREE/ 
   Conditio   Religi_1   Negative   . 
BEGIN DATA. 
     1.0000     1.0000    12.4333 
     2.0000     1.0000    16.7143 
     3.0000     1.0000    13.2727 
     1.0000     2.0000    20.1200 
     2.0000     2.0000    21.8611 
     3.0000     2.0000    18.9032 
END DATA. 
GRAPH/SCATTERPLOT= 
 Conditio WITH     Negative BY       Religi_1 .

DATA LIST FREE/ 
   Conditio   SM_Use1    Negative   . 
BEGIN DATA. 
     1.0000    -1.3291    18.1065 
     2.0000    -1.3291    19.6404 
     3.0000    -1.3291    17.4926 
     1.0000      .0000    15.5855 
     2.0000      .0000    19.6602 
     3.0000      .0000    16.0371 
     1.0000     1.3291    13.0646 
     2.0000     1.3291    19.6800 
     3.0000     1.3291    14.5816 
END DATA. 
GRAPH/SCATTERPLOT= 
 Conditio  WITH     Negative BY       SM_Use1 .

DATA LIST FREE/ 
   Conditio   Time_Out   Negative   . 
BEGIN DATA. 
     1.0000    -1.1616    17.2622 
     2.0000    -1.1616    17.0255 
     3.0000    -1.1616    14.9307 
     1.0000      .0000    16.1485 
     2.0000      .0000    19.6304 
     3.0000      .0000    15.6659 
     1.0000     1.1616    15.0348 
     2.0000     1.1616    22.2353 
     3.0000     1.1616    16.4011 
END DATA. 
GRAPH/SCATTERPLOT= 
 Conditio WITH     Negative BY       Time_Out .

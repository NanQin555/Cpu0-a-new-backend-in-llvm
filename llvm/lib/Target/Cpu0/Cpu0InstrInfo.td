//===----------------------------------------------------------------------===//
// Cpu0 Instruction Predicate Definitions.
//===----------------------------------------------------------------------===//

def Ch3_1       :     Predicate<"Subtarget->hasChapter3_1()">,
                      AssemblerPredicate<(all_of FeatureChapter3_1)>;
def Ch3_2       :     Predicate<"Subtarget->hasChapter3_2()">,
                      AssemblerPredicate<(all_of FeatureChapter3_2)>;
def Ch3_3       :     Predicate<"Subtarget->hasChapter3_3()">,
                      AssemblerPredicate<(all_of FeatureChapter3_3)>;
def Ch3_4       :     Predicate<"Subtarget->hasChapter3_4()">,
                      AssemblerPredicate<(all_of FeatureChapter3_4)>;
def Ch3_5       :     Predicate<"Subtarget->hasChapter3_5()">,
                      AssemblerPredicate<(all_of FeatureChapter3_5)>;
def Ch4_1       :     Predicate<"Subtarget->hasChapter4_1()">,
                      AssemblerPredicate<(all_of FeatureChapter4_1)>;
def Ch4_2       :     Predicate<"Subtarget->hasChapter4_2()">,
                      AssemblerPredicate<(all_of FeatureChapter4_2)>;
def Ch5_1       :     Predicate<"Subtarget->hasChapter5_1()">,
                      AssemblerPredicate<(all_of FeatureChapter5_1)>;
def Ch6_1       :     Predicate<"Subtarget->hasChapter6_1()">,
                      AssemblerPredicate<(all_of FeatureChapter6_1)>;
def Ch7_1       :     Predicate<"Subtarget->hasChapter7_1()">,
                      AssemblerPredicate<(all_of FeatureChapter7_1)>;
def Ch8_1       :     Predicate<"Subtarget->hasChapter8_1()">,
                      AssemblerPredicate<(all_of FeatureChapter8_1)>;
def Ch8_2       :     Predicate<"Subtarget->hasChapter8_2()">,
                      AssemblerPredicate<(all_of FeatureChapter8_2)>;
def Ch9_1       :     Predicate<"Subtarget->hasChapter9_1()">,
                      AssemblerPredicate<(all_of FeatureChapter9_1)>;
def Ch9_2       :     Predicate<"Subtarget->hasChapter9_2()">,
                      AssemblerPredicate<(all_of FeatureChapter9_2)>;
def Ch9_3       :     Predicate<"Subtarget->hasChapter9_3()">,
                      AssemblerPredicate<(all_of FeatureChapter9_3)>;
def Ch10_1      :     Predicate<"Subtarget->hasChapter10_1()">,
                      AssemblerPredicate<(all_of FeatureChapter10_1)>;
def Ch11_1      :     Predicate<"Subtarget->hasChapter11_1()">,
                      AssemblerPredicate<(all_of FeatureChapter11_1)>;
def Ch11_2      :     Predicate<"Subtarget->hasChapter11_2()">,
                      AssemblerPredicate<(all_of FeatureChapter11_2)>;
def Ch12_1      :     Predicate<"Subtarget->hasChapter12_1()">,
                      AssemblerPredicate<(all_of FeatureChapter12_1)>;
def Ch_all      :     Predicate<"Subtarget->hasChapterAll()">,
                      AssemblerPredicate<(all_of FeatureChapterAll)>;

def EnableOverflow  : Predicate<"Subtarget->enableOverflow()">;
def DisableOverflow : Predicate<"Subtarget->disableOverflow()">;

def HasCmp      :     Predicate<"Subtarget->hasCmp()">;
def HasSlt      :     Predicate<"Subtarget->hasSlt()">;
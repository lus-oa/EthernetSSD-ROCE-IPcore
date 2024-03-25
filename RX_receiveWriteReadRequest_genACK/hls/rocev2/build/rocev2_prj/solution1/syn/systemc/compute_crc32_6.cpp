#include "compute_crc32.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void compute_crc32::thread_zext_ln452_97_fu_11549_p1() {
    zext_ln452_97_fu_11549_p1 = esl_zext<32,31>(lshr_ln452_96_fu_11539_p4.read());
}

void compute_crc32::thread_zext_ln452_98_fu_11581_p1() {
    zext_ln452_98_fu_11581_p1 = esl_zext<32,31>(lshr_ln452_97_fu_11571_p4.read());
}

void compute_crc32::thread_zext_ln452_99_fu_11613_p1() {
    zext_ln452_99_fu_11613_p1 = esl_zext<32,31>(lshr_ln452_98_fu_11603_p4.read());
}

void compute_crc32::thread_zext_ln452_9_fu_1845_p1() {
    zext_ln452_9_fu_1845_p1 = esl_zext<32,31>(lshr_ln452_9_fu_1835_p4.read());
}

void compute_crc32::thread_zext_ln452_fu_1507_p1() {
    zext_ln452_fu_1507_p1 = esl_zext<32,31>(lshr_ln_fu_1497_p4.read());
}

}


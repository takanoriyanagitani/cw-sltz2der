#include <stdint.h>
#include <stdbool.h>

int32_t sltz2der(const char single_letter_time_zone){
  const uint8_t u = single_letter_time_zone;
  const uint8_t ascii = u & 0x7f;
  const bool isup = 0x41 <= ascii && ascii <= 0x5a;
  const uint8_t msk = isup ? 0x20 : 0x00;
  const uint8_t masked = ascii | msk;
  const bool islo = 0x61 <= masked && masked <= 0x7a;
  const uint8_t dec = islo ? 0x60 : 0x00;
  const uint8_t tagval = masked - dec;
  const uint8_t final = islo ? tagval : 0x00;
  const int32_t base = 0x00008000;
  const int32_t widen = final;
  return base | (widen << 8);
}

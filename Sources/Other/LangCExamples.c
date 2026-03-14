#include "LangCExamples.h"

CPlaygroundData addFive(CPlaygroundData data) {
    CPlaygroundData newData = { data.a + 5, data.b + 5};
    return newData;
}


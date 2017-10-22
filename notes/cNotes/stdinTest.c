#include <stdio.h>

int main() {
    char charRead;
    charRead = fgetc(stdin);

    while (charRead != EOF) {
        printf("%c", charRead);
        charRead = fgetc(stdin);
    }
    int i;
    for (i = 0; i < 5; i++) {
        charRead = ungetc(charRead, stdin);
    }
    while (charRead != EOF) {
        printf("%c",charRead);
        charRead = fgetc(stdin);
    }
    return 0;
}

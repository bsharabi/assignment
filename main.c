#include "sequences.h"
void menuInput(char* word, char* txt) {
	int i = 0;
	char c = 0;
	while ((c = getchar()) != ' ' && (c != '\t') && (c != '\n'))
		word[i++] = c;
	word[i] = '\0';

	i = 0;c = 0;
	while ((c = getchar()) != '~')
		txt[i++] = c;
	txt[i] = '\0';
	
    // while(strlen(stdin->_IO_read_ptr)!=0) getchar();
    // if (strlen(stdin->_IO_read_base)!=0) {
    //     memset(stdin->_IO_read_base,0,strlen(stdin->_IO_read_base));
    // }
    
}
int main() {
	char* word = (char*)malloc(WORD * sizeof(char));
	char* txt = (char*)malloc(TXT * sizeof(char));
	menuInput(word, txt);
	printf("Gematria Sequences: ");
	Gematria(txt, word);
	printf("Atbash Sequences: ");
	Atbash(txt, word);
	printf("Anagram Sequences: ");
	Anagram(txt, word);
	free(word);
	free(txt);
	return 0;
}
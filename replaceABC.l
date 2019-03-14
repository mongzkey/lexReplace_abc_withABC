/*lex program to replace all occurences of 'abc' with 'ABC'.*/
%{

char* findString(char* patternMatched, char* stringToFind, const char* stringToReplaceWith){
	//Finding in cases where string may be existing as a substring
	char *str = strstr(patternMatched, stringToFind);		//returns pointer to start of substring value find
	int beginLen = strlen(patternMatched)-strlen(str);	//counts number of characters before the substring of interest

	int i = 0;

	for(;*stringToFind;++stringToFind,++str){}	//loops(skips) over the characters that needs to be replaced in str

	char* out = (char *) malloc(beginLen + strlen(stringToReplaceWith) + strlen(str) + 1);	//allocate memory for new replacement string

	for(i=0;i<beginLen;++i){
		out[i] = patternMatched[i];		//copies the first unmatched substring to out, if any
	}
	
	strcat(out, stringToReplaceWith);		//adds the replacement string to out(reason we skipped characters in str)
	strcat(out, str);			//finally adds rest of str that was not skipped

	return out;
}
%}

%%
[a-zA-Z']*abc[a-zA-Z]* {
printf("%s", findString(yytext, "abc", "ABC"));
}
%%

int yywrap(){}

int main(){
   //input from console
    printf("Enter the string: \n\n");
    
    yylex();     
    return 0;
}

#include "StdAfx.h"
#include "C.h"

void C::f() {
	printf("%s\n","hello");
}

void test() {
	C *pc;
	pc->f(); // warn: object pointer is uninitialized

	printf("\nget ub[%lu]", sizeof(C));
}

int func() {
	int itemp = 2;
	char* pvect[5] = { "a","b","c","c","e" };
	char* pmap[5] = {};
	int ilen = sizeof(pvect);

	for (int i = 0; i < ilen; i++) {
		char* pp = new char[10240000];
		pvect[i] = pp;  
		pmap[i] = pvect[i];
	}
	int jlen = sizeof(pmap) - 3;
	for (int j = 0; j < jlen; j++)
	{
		//delete pmap[j];
	}

	return 0;
}
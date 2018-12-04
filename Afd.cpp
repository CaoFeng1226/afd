///////////////////////////////////////////////////////////////////////
// If this program works, it was written by Alexander Fedorov.
// If not, I don't know who wrote it.
// mailto:lamer2000@hotmail.com
// Home Page: http://members.xoom.com/lamer2000/
// This file is part of Alexf Dialer.
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
///////////////////////////////////////////////////////////////////////

// Afd.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "Afd.h"
#include "AfdDlg.h"
#include "Page1.h"
#include "Page2.h"
#include "Page3.h"
#include "Page4.h"
#include <mmsystem.h>




#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAfdApp

BEGIN_MESSAGE_MAP(CAfdApp, CWinApp)
	//{{AFX_MSG_MAP(CAfdApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAfdApp construction

CAfdApp::CAfdApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CAfdApp object

CAfdApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CAfdApp initialization

BOOL CAfdApp::InitInstance()
{
    int i;
	LPCTSTR pCh = NULL; 
	if (NULL != pCh) {}
/*
	HINSTANCE hDLL = NULL;
	CString sLangDll;
	CFileStatus status;
	if (NULL == hDLL)
	{
		sLangDll = "AFD_Portuguese.dll";
		if(CFile::GetStatus(sLangDll, status))
		hDLL = LoadLibrary(sLangDll);
	}

///...
	if (hDLL != NULL) AfxSetResourceHandle(hDLL);
*/
/*
	HINSTANCE hDLL = LoadLibrary(
	"E:\\PROG\\AFD\\AFD_Portuguese\\Debug\\AFD_Portuguese.dll"
	);
	if (NULL == hDLL)
	{
		PrintError();
		return FALSE; // Failed to load the localized resources.
	}
	else
	{
//		static DWORD dwBrazil =
//		MAKELCID(MAKELANGID(LANG_PORTUGUESE, SUBLANG_PORTUGUESE_BRAZILIAN), SORT_DEFAULT);
//		SetThreadLocale(dwBrazil);
		AfxSetResourceHandle(hDLL);
	}
*/

	AfxEnableControlContainer();

	// Standard initialization
	// If you are not using these features and wish to reduce the size
	//  of your final executable, you should remove from the following
	//  the specific initialization routines you do not need.

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	// www.codeguru.com/dialog/instance
	CWnd * pWndPrev;
	CWnd * pWndChild;
	pWndPrev = CWnd::FindWindow(_T("#32770"), "Alexf Dialer");
	if (pWndPrev)
	{
		pWndChild = pWndPrev->GetLastActivePopup();
		CString aaa = m_lpCmdLine;
		aaa.MakeUpper();
		if (aaa.Find("/E") != -1)
		{
			pWndPrev->SendMessage(WM_CLOSE, 0, 0);
			return FALSE;
		}
		if (pWndPrev->IsIconic()) pWndPrev->ShowWindow(SW_RESTORE);
		pWndChild->SetForegroundWindow();
		return FALSE;
	}
	GetModuleFileName(NULL, sIniFileName.GetBuffer(MAX_PATH), MAX_PATH);
	sIniFileName.ReleaseBuffer();
	sIniFileName.MakeReverse();
	sIniFileName = sIniFileName.Right(sIniFileName.GetLength() - sIniFileName.Find('\\'));
	sIniFileName.MakeReverse();
	sIniFileName += _T("afd.ini");

	pPerf[PERF_ConnectSpeed] = new CAlexfPerf(ALEXF_PERF_DIALUP_CONNECTSPEED);
	pPerf[PERF_BytesRecvd]   = new CAlexfPerf(ALEXF_PERF_DIALUP_BYTESRECVD);
	pPerf[PERF_BytesXmit]    = new CAlexfPerf(ALEXF_PERF_DIALUP_BYTESXMIT);
	for (int i = 0; i < PERF_ARRAY; i++) if (NULL == pPerf[i]) return FALSE;

	pDlg = new CAfdDlg;
	m_pMainWnd = pDlg;
	int nResponse = pDlg->DoModal();
	if (IDOK == nResponse)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with OK
	}
	else if (IDCANCEL == nResponse)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with Cancel
	}
	m_pMainWnd = NULL;

	for (i = 0; i < PERF_ARRAY; i++) delete pPerf[i];

	delete pDlg;

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}

BOOL CAfdApp::LOG(UINT nID)
{
	CString sss;
	if (!sss.LoadString(nID)) return FALSE;
	LOG(sss);
	return TRUE;
}

BOOL CAfdApp::LOG(CString sss)
{
	if (!pDlg) {ASSERT(0); return FALSE;}
	if (!pDlg->page3) {ASSERT(0); return FALSE;}
	TRY
	{
		CFile f(pDlg->page3->m_sLog,
		CFile::modeCreate | CFile::modeWrite | CFile::modeNoTruncate | CFile::shareDenyNone);
		TRY
		{
			f.SeekToEnd();
			CTime t = CTime::GetCurrentTime();
			CString aaa;
			sprintf(aaa.GetBuffer(512),
			"%4d-%02d-%02d %02d:%02d:%02d %s\r\n",
			t.GetYear(), t.GetMonth(), t.GetDay(),
			t.GetHour(), t.GetMinute(), t.GetSecond(), sss);
			aaa.ReleaseBuffer();
			f.Write(aaa, aaa.GetLength());
			f.Close();
		}
		CATCH(CFileException, e)
		{
			f.Close();
		}
		END_CATCH
	}
	CATCH(CFileException, e)
	{
		TRACE(CString("File could not be opened " + e->m_cause) + "\n");
		return FALSE;
	}
	END_CATCH
	return TRUE;
}

CString CAfdApp::GetIniString(CString sec, CString key, CString str)
{
	CString sss;
	GetPrivateProfileString(sec, key, str, sss.GetBuffer(512), 511, sIniFileName);
	sss.ReleaseBuffer();
	return sss;
}

BOOL CAfdApp::SetIniString(CString sec, CString key, CString str)
{
	return WritePrivateProfileString(sec, key, str, sIniFileName);
}

CString CAfdApp::GetCurrentProviderName()
{
	if (!pDlg){ASSERT(0); return CString();}
	if (!pDlg->page1){ASSERT(0); return CString();}
	return pDlg->page1->sCurrentProvider;
}

BOOL CAfdApp::IsConnected()
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page1){ASSERT(0); return FALSE;}
	return pDlg->page1->bConnected;
}

BOOL CAfdApp::SetLastCallText(CString sss)
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page1){ASSERT(0); return FALSE;}
	pDlg->page1->m_LastCallText = sss;
	pDlg->page1->UpdateData(FALSE);
	return FALSE;
}

BOOL CAfdApp::PushBigButton()
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page1){ASSERT(0); return FALSE;}
	pDlg->page1->PublicOnDial();
	return TRUE;
}

BOOL CAfdApp::StartSession()
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page2){ASSERT(0); return FALSE;}
	if (!pDlg->page3){ASSERT(0); return FALSE;}
	if (!pDlg->page4){ASSERT(0); return FALSE;}
	CString sss = pDlg->page2->m_sSoundLogin;
	if (!sss.IsEmpty())
	sndPlaySound(sss, SND_ASYNC);
	pDlg->page3->StartSession();
	pDlg->page4->StartSession();
	return FALSE;
}

BOOL CAfdApp::PostDialMessage(UINT unMsg, WPARAM rasconnstate, DWORD dwError)
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page1){ASSERT(0); return FALSE;}
	pDlg->page1->PostMessage(WM_DIAL_FUNC, rasconnstate, dwError);
	return TRUE;
}

BOOL CAfdApp::FinishSession()
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page1){ASSERT(0); return FALSE;}
	if (!pDlg->page2){ASSERT(0); return FALSE;}
	if (!pDlg->page4){ASSERT(0); return FALSE;}
	if (pDlg->page1->bConnected)
	{
		if (!pDlg->page2->m_sSoundLogout.IsEmpty())
		sndPlaySound(pDlg->page2->m_sSoundLogout, SND_ASYNC);
		pDlg->page4->FinishSession();
	}
	return FALSE;
}

BOOL CAfdApp::NotifyProviderChanged()
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page2){ASSERT(0); return FALSE;}
	if (!pDlg->page4){ASSERT(0); return FALSE;}
	pDlg->page2->Reload();
	pDlg->page4->SetStatisticData();
	return FALSE;
}

CString CAfdApp::GetCurrentIPAddress()
{
	if (!pDlg){ASSERT(0); return CString();}
	if (!pDlg->page1){ASSERT(0); return CString();}
	return pDlg->page1->GetIPAddress();
}

BOOL CAfdApp::RunProgramsOnEvent(int iCondition)
{
	if (!pDlg){ASSERT(0); return FALSE;}
	if (!pDlg->page2){ASSERT(0); return FALSE;}
	AfxBeginThread(CPage2::RunPrograms, (LPVOID) iCondition);
	return TRUE;
}

CString CAfdApp::GetPassword(BOOL b)
{
	if (!pDlg){ASSERT(0); return "";}
	if (!pDlg->page2){ASSERT(0); return "";}
	return pDlg->page2->GetPassword(b);
}

char* CAfdApp::foo(char* ptr) {
	return NULL;
}

char* CAfdApp::bar() {
	char* ptr;
	int* ptr1 = nullptr;
	foo(ptr); 
	return nullptr;
}

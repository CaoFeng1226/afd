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

// Page5.cpp : implementation file
//

#include "stdafx.h"
#include "Afd.h"
#include "Page5.h"
#include <mmsystem.h>
#include "imapi.h"
#include "ModulVer.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

CString GetVersionInfo(PSTR pszFileName)
{
	CString sss;
	DWORD cbVerInfo, dummy;
	char* p_str = new char[30];
	// How big is the version info?
	cbVerInfo = GetFileVersionInfoSize(pszFileName, &dummy);
	if (!cbVerInfo) return sss;
	// Allocate space to hold the info
	PBYTE pVerInfo = new BYTE[cbVerInfo];
	if (!pVerInfo) return sss;
	if (!GetFileVersionInfo(pszFileName, 0, cbVerInfo, pVerInfo))
	return sss;
	char * predefResStrings[] =
	{
		"CompanyName",
		"FileDescription",
		"FileVersion",
		"InternalName",
		"LegalCopyright",
		"OriginalFilename",
		"ProductName",
		"ProductVersion",
		0
	};
	for (unsigned i=0; predefResStrings[i]; i++)
	{
		char szQueryStr[ 0x100 ];
		wsprintf(szQueryStr, "\\StringFileInfo\\040904b0\\%s",
		predefResStrings[i]);
		PSTR pszVerRetVal;
		UINT cbReturn;
		BOOL fFound;
		fFound = VerQueryValue(pVerInfo, szQueryStr,
		(LPVOID *)&pszVerRetVal, &cbReturn);
		if (fFound)
		{
			if (i != 0) sss += " ";
			sss += predefResStrings[i];
			sss += " ";
			sss += pszVerRetVal;
		}
	}
	delete []pVerInfo;
	return sss;
} 

/////////////////////////////////////////////////////////////////////////////
// CPage5 p roperty page

IMPLEMENT_DYNCREATE(CPage5, CPropertyPage)

CPage5::CPage5() : CPropertyPage(CPage5::IDD)
{
	//{{AFX_DATA_INIT(CPage5)
	m_sMail = _T("");
	//}}AFX_DATA_INIT
}

CPage5::~CPage5()
{
}

void CPage5::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPage5)
	DDX_Control(pDX, IDC_STATIC_SRC, m_hlSrc);
	DDX_Control(pDX, IDC_FACE_FRAME, m_wnsFace);
	DDX_Control(pDX, IDC_STATIC_HOMEPAGE2, m_hlMailList);
	DDX_Control(pDX, IDC_STATIC_VERSION, m_stVersion);
	DDX_Control(pDX, IDC_STATIC_MAIL, m_stMail);
	DDX_Control(pDX, IDC_STATIC_HOMEPAGE, m_stHomePage);
	DDX_Text(pDX, IDC_EDIT_MAIL, m_sMail);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPage5, CPropertyPage)
	//{{AFX_MSG_MAP(CPage5)
	ON_WM_DESTROY()
	ON_WM_PAINT()
	ON_BN_CLICKED(IDC_BUTTON_MAIL, OnButtonMail)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPage5 message handlers

CString GetSysVer()
{
	CString sss;
	OSVERSIONINFOEX osvi;
	BOOL bOsVersionInfoEx;
	// Try calling GetVersionEx using the OSVERSIONINFOEX structure,
	// which is supported on Windows 2000.
	// If that fails, try using the OSVERSIONINFO structure.
	ZeroMemory(&osvi, sizeof(OSVERSIONINFOEX));
	osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOEX);
	if( !(bOsVersionInfoEx = GetVersionEx((OSVERSIONINFO*) &osvi)))
	{
		// If OSVERSIONINFOEX doesn't work, try OSVERSIONINFO.
		osvi.dwOSVersionInfoSize = sizeof (OSVERSIONINFO);
		if (!GetVersionEx((OSVERSIONINFO*) &osvi)) return sss;
	}
	switch (osvi.dwPlatformId)
	{
	case VER_PLATFORM_WIN32_NT:
		// Test for the product.
		if (4 >= osvi.dwMajorVersion) sss += "WinNT/";
		if (5 == osvi.dwMajorVersion) sss += "Win2k/";
		// Test for workstation versus server.
		/*
		if(bOsVersionInfoEx)
		{
            if (osvi.wProductType == VER_NT_WORKSTATION)
				sss += "WStat/";
            if (osvi.wProductType == VER_NT_SERVER)
				sss += "Serv/";
		}
		else
		*/
		{
            HKEY hKey;
            char szProductType[80];
            DWORD dwBufLen;
            RegOpenKeyEx(HKEY_LOCAL_MACHINE, "SYSTEM\\CurrentControlSet\\Control\\ProductOptions", 0, KEY_QUERY_VALUE, &hKey);
            RegQueryValueEx(hKey, "ProductType", NULL, NULL, (LPBYTE) szProductType, &dwBufLen);
            RegCloseKey(hKey);
            if (0 == lstrcmpi("WINNT", szProductType)) sss += "WStat/";
            if (0 == lstrcmpi("SERVERNT", szProductType)) sss += "Serv/";
		}
        break;
	case VER_PLATFORM_WIN32_WINDOWS:
		if ((osvi.dwMajorVersion > 4) || ((osvi.dwMajorVersion == 4) && (osvi.dwMinorVersion > 0)))
			sss += "Win98/";
		else sss += "Win95/";
		break;
	case VER_PLATFORM_WIN32s:
		sss += "Win32s/";
		break;
	}
	// Display version, service pack (if any), and build number.
	sss += osvi.szCSDVersion;
	sss += "/";
	sss += L2S(osvi.dwMajorVersion);
	sss += ".";
	sss += L2S(osvi.dwMinorVersion);
	sss += ".";
	sss += L2S(osvi.dwBuildNumber & 0xFFFF);
	return sss;
}

CString GetWindowsVersion()
{
	OSVERSIONINFO osv;
	osv.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	CString WindowsPlatform;
	if (GetVersionEx(&osv))
	{
		// note: szCSDVersion =  service pack  release  
		CString ServiceRelease = osv.szCSDVersion;
		switch(osv.dwPlatformId)
		{
		case VER_PLATFORM_WIN32s: //Win32s on Windows 3.1.
			WindowsPlatform = "Microsoft?Windows 3.1(TM)";
			break;
		case VER_PLATFORM_WIN32_WINDOWS: //WIN32 on 95 or 98
			//determine if Win95 or Win98
			if (0 == osv.dwMinorVersion)
			{
				WindowsPlatform = "Microsoft?Windows 95(TM) " + ServiceRelease;
			}
			else
			{
				WindowsPlatform = "Microsoft?Windows 98(TM) " + ServiceRelease;
			}
			break;
		case VER_PLATFORM_WIN32_NT: //Win32 on Windows NT.
			WindowsPlatform = "Microsoft?Windows NT(TM) "  + ServiceRelease;
			break;
		default:
			WindowsPlatform = "Failed to get correct Operating System.";
		}
		//end switch
	}
	//end if
	return WindowsPlatform;
}

BOOL CPage5::InitPropertyPage()
{
	m_Bitmap.LoadMappedBitmap(IDB_BGROUND5);
	m_stVersion.SetColours(	RGB(0x00, 0x00, 0x80), RGB(0x80, 0x00, 0x80), RGB(0x00, 0x00, 0xFF));
	m_stMail.SetColours(	RGB(0x00, 0x00, 0x80), RGB(0x80, 0x00, 0x80), RGB(0x00, 0x00, 0xFF));
	m_stHomePage.SetColours(RGB(0x00, 0x00, 0x80), RGB(0x80, 0x00, 0x80), RGB(0x00, 0x00, 0xFF));
	m_hlMailList.SetColours(RGB(0x00, 0x00, 0x80), RGB(0x80, 0x00, 0x80), RGB(0x00, 0x00, 0xFF));
	m_hlSrc.SetColours(RGB(0x00, 0x00, 0x80), RGB(0x80, 0x00, 0x80), RGB(0x00, 0x00, 0xFF));
	m_sDefaultLetter = "Please do not remove this line! Program Version: ";
	m_sDefaultLetter += __DATE__;
	m_sDefaultLetter += " OS: " + GetSysVer();
	{
		CModuleVersion ver;
		m_sDefaultLetter += " RAS Version: ";
		if (ver.GetFileVersionInfo("Rasapi32.dll"))
		{
			m_sDefaultLetter += L2S(HIWORD(ver.dwFileVersionMS)) + ".";
			m_sDefaultLetter += L2S(LOWORD(ver.dwFileVersionMS)) + ".";
			m_sDefaultLetter += L2S(HIWORD(ver.dwFileVersionLS)) + ".";
			m_sDefaultLetter += L2S(LOWORD(ver.dwFileVersionLS));
		}
		else
		m_sDefaultLetter += "error";
	}
	{
		CModuleVersion ver;
		m_sDefaultLetter += " Crypt32.dll Version: ";
		if (ver.GetDLLVersionInfo("crypt32.dll"))
		{
			m_sDefaultLetter += L2S(HIWORD(ver.dwFileVersionMS)) + ".";
			m_sDefaultLetter += L2S(LOWORD(ver.dwFileVersionMS)) + ".";
			m_sDefaultLetter += L2S(HIWORD(ver.dwFileVersionLS)) + ".";
			m_sDefaultLetter += L2S(LOWORD(ver.dwFileVersionLS));
		}
		else
		m_sDefaultLetter += "error";
	}
	m_sDefaultLetter += "\r\n";
	m_sMail = m_sDefaultLetter;
// version
	CString sss; sss.LoadString(IDS_LAST_UPDATES); sss += __DATE__;
	m_stVersion.SetWindowText(sss);
	m_stVersion.SetURL(_T("http://members.xoom.com/lamer2000/afd.zip"));
//
	m_stHomePage.SetURL(_T("http://members.xoom.com/lamer2000/"));
	m_stMail.SetURL(_T("mailto:lamer2000@hotmail.com"));
	sss.LoadString(IDS_SRC_INFO);
	m_hlSrc.SetWindowText(sss);
	m_hlSrc.SetURL(_T("http://members.xoom.com/lamer2000/msvc/"));
//
	sss.LoadString(IDS_JOIN_MAIL_LIST);
	m_hlMailList.SetWindowText(sss);
	m_hlMailList.SetURL(_T("http://members.xoom.com/lamer2000/afd/"));
// midi
	LPVOID lpv;
	HRSRC res;
	HANDLE resh;
	FILE *fil;
	CString dir;
	GetTempPath(MAX_PATH, dir.GetBuffer(MAX_PATH + 1));
	dir.ReleaseBuffer();
	dir.MakeReverse();
	if (0 == dir.Find("\\")) dir = dir.Mid(1, dir.GetLength());
	dir.MakeReverse();
	dir += "\\tmp666.mid";
	HINSTANCE hInst = AfxGetResourceHandle();
	res = ::FindResource(hInst, MAKEINTRESOURCE(IDR_MIDIFILE1), "MIDIFILE");
	resh = LoadResource(hInst, res);
	lpv = LockResource(resh);
	fil = fopen(dir,"wb");
	fwrite(lpv,SizeofResource(AfxGetResourceHandle(), res),1,fil);
	fclose(fil);
	CString s ="open " + dir;
	s += " alias kulmuzon";
	MCIERROR mer = mciSendString(s, NULL, 0, 0);
//	if (mer != 0){char ccc[256]; mciGetErrorString(mer, ccc, 256);
//	AfxMessageBox(ccc);}
	mer = mciSendString("play kulmuzon", NULL, 0, 0);
//	if (mer != 0){char ccc[256]; mciGetErrorString(mer, ccc, 256);
//	AfxMessageBox(ccc);}
	mer = mciSendString("pause kulmuzon", NULL, 0, 0);
//	if (mer != 0){char ccc[256]; mciGetErrorString(mer, ccc, 256);
//	AfxMessageBox(ccc);}
	UpdateData(FALSE);
	return TRUE;
}

BOOL CPage5::OnInitDialog() 
{
	CPropertyPage::OnInitDialog();
	return InitPropertyPage();
}

void CPage5::OnDestroy() 
{
	mciSendString("stop kulmuzon", NULL, 0, 0);
	CPropertyPage::OnDestroy();
}

BOOL CPage5::OnSetActive() 
{
	mciSendString("resume kulmuzon", NULL, 0, 0);
	return CPropertyPage::OnSetActive();
}

BOOL CPage5::OnKillActive() 
{
	mciSendString("pause kulmuzon", NULL, 0, 0);
	return CPropertyPage::OnKillActive();
}

void CPage5::OnPaint() 
{
	CPaintDC dc(this);
	BITMAP BitInfo;
	CRect R;
	GetClientRect(&R);
	CDC MemDC;
	MemDC.CreateCompatibleDC(&dc);
	m_Bitmap.GetObject(sizeof(BitInfo), &BitInfo);
	CBitmap* oldBitmap = MemDC.SelectObject(&m_Bitmap);
	int x = R.Width() / BitInfo.bmWidth + 1;
	int y = R.Height() / BitInfo.bmHeight + 1;
	for (int a = 0; a < x; a++)
	for (int b = 0; b < y; b++)
	{
		CRect rr(R);
		rr.OffsetRect(a * BitInfo.bmWidth, b * BitInfo.bmHeight);
		dc.BitBlt(rr.left, rr.top, BitInfo.bmWidth, BitInfo.bmHeight,
			&MemDC, 0, 0, SRCCOPY);
	}
	MemDC.SelectObject(oldBitmap);
}

void CPage5::OnButtonMail() 
{
	UpdateData();
	if (m_sMail == m_sDefaultLetter) return;
	CIMapi mapi;
	mapi.To("lamer2000@hotmail.com");
	mapi.Subject("AFD AUTO Comments");
	mapi.Text(m_sMail);
	mapi.Send();
	UpdateData(FALSE);
}

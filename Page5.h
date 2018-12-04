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

#if !defined(AFX_PAGE5_H__298DD353_F00C_11D2_9864_D86B908C7AFE__INCLUDED_)
#define AFX_PAGE5_H__298DD353_F00C_11D2_9864_D86B908C7AFE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Page5.h : header file
//

#include "HyperLink.h"
#include "FaceWnd.h"

/////////////////////////////////////////////////////////////////////////////
// CPage5 dialog

class CPage5 : public CPropertyPage
{
	DECLARE_DYNCREATE(CPage5)

// Construction
public:
	UINT uTimer;
	CString m_sDefaultLetter;
	CBitmap m_Bitmap;
	BOOL InitPropertyPage();
	CPage5();
	~CPage5();

// Dialog Data
	//{{AFX_DATA(CPage5)
	enum { IDD = IDD_DIALOG5 };
	CHyperLink	m_hlSrc;
	CFaceWnd	m_wnsFace;
	CHyperLink m_hlMailList;
	CHyperLink m_stVersion;
	CHyperLink m_stMail;
	CHyperLink m_stHomePage;
	CString	m_sMail;
	//}}AFX_DATA


// Overrides
	// ClassWizard generate virtual function overrides
	//{{AFX_VIRTUAL(CPage5)
	public:
	virtual BOOL OnSetActive();
	virtual BOOL OnKillActive();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	// Generated message map functions
	//{{AFX_MSG(CPage5)
	virtual BOOL OnInitDialog();
	afx_msg void OnDestroy();
	afx_msg void OnPaint();
	afx_msg void OnButtonMail();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PAGE5_H__298DD353_F00C_11D2_9864_D86B908C7AFE__INCLUDED_)

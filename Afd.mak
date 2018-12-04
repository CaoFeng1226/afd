# Microsoft Developer Studio Generated NMAKE File, Based on Afd.dsp
!IF "$(CFG)" == ""
CFG=Afd - Win32 Debug
!MESSAGE No configuration specified. Defaulting to Afd - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "Afd - Win32 Release" && "$(CFG)" != "Afd - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Afd.mak" CFG="Afd - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Afd - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Afd - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "Afd - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\Afd.exe" "$(OUTDIR)\Afd.bsc"


CLEAN :
	-@erase "$(INTDIR)\Afd.obj"
	-@erase "$(INTDIR)\Afd.pch"
	-@erase "$(INTDIR)\Afd.res"
	-@erase "$(INTDIR)\Afd.sbr"
	-@erase "$(INTDIR)\AfdDlg.obj"
	-@erase "$(INTDIR)\AfdDlg.sbr"
	-@erase "$(INTDIR)\AFDialPanel.obj"
	-@erase "$(INTDIR)\AFDialPanel.sbr"
	-@erase "$(INTDIR)\AlexfPerf.obj"
	-@erase "$(INTDIR)\AlexfPerf.sbr"
	-@erase "$(INTDIR)\FaceWnd.obj"
	-@erase "$(INTDIR)\FaceWnd.sbr"
	-@erase "$(INTDIR)\HyperLink.obj"
	-@erase "$(INTDIR)\HyperLink.sbr"
	-@erase "$(INTDIR)\IMapi.obj"
	-@erase "$(INTDIR)\IMapi.sbr"
	-@erase "$(INTDIR)\ModulVer.obj"
	-@erase "$(INTDIR)\ModulVer.sbr"
	-@erase "$(INTDIR)\Page1.obj"
	-@erase "$(INTDIR)\Page1.sbr"
	-@erase "$(INTDIR)\Page2.obj"
	-@erase "$(INTDIR)\Page2.sbr"
	-@erase "$(INTDIR)\Page3.obj"
	-@erase "$(INTDIR)\Page3.sbr"
	-@erase "$(INTDIR)\Page4.obj"
	-@erase "$(INTDIR)\Page4.sbr"
	-@erase "$(INTDIR)\Page5.obj"
	-@erase "$(INTDIR)\Page5.sbr"
	-@erase "$(INTDIR)\PhoneNumberDlg.obj"
	-@erase "$(INTDIR)\PhoneNumberDlg.sbr"
	-@erase "$(INTDIR)\RunProgDlg.obj"
	-@erase "$(INTDIR)\RunProgDlg.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\trayicon.obj"
	-@erase "$(INTDIR)\trayicon.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\Afd.bsc"
	-@erase "$(OUTDIR)\Afd.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Afd.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Afd.res" /d "NDEBUG" /d "AFX_RESOURCE_DLL" /d "AFX_TARG_NEU" /d "AFX_TARG_ENU" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Afd.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Afd.sbr" \
	"$(INTDIR)\AfdDlg.sbr" \
	"$(INTDIR)\AFDialPanel.sbr" \
	"$(INTDIR)\AlexfPerf.sbr" \
	"$(INTDIR)\FaceWnd.sbr" \
	"$(INTDIR)\HyperLink.sbr" \
	"$(INTDIR)\IMapi.sbr" \
	"$(INTDIR)\ModulVer.sbr" \
	"$(INTDIR)\Page1.sbr" \
	"$(INTDIR)\Page2.sbr" \
	"$(INTDIR)\Page3.sbr" \
	"$(INTDIR)\Page4.sbr" \
	"$(INTDIR)\Page5.sbr" \
	"$(INTDIR)\PhoneNumberDlg.sbr" \
	"$(INTDIR)\RunProgDlg.sbr" \
	"$(INTDIR)\StdAfx.sbr" \
	"$(INTDIR)\trayicon.sbr"

"$(OUTDIR)\Afd.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=RASAPI32.LIB WINMM.LIB version.lib /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\Afd.pdb" /machine:I386 /out:"$(OUTDIR)\Afd.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Afd.obj" \
	"$(INTDIR)\AfdDlg.obj" \
	"$(INTDIR)\AFDialPanel.obj" \
	"$(INTDIR)\AlexfPerf.obj" \
	"$(INTDIR)\FaceWnd.obj" \
	"$(INTDIR)\HyperLink.obj" \
	"$(INTDIR)\IMapi.obj" \
	"$(INTDIR)\ModulVer.obj" \
	"$(INTDIR)\Page1.obj" \
	"$(INTDIR)\Page2.obj" \
	"$(INTDIR)\Page3.obj" \
	"$(INTDIR)\Page4.obj" \
	"$(INTDIR)\Page5.obj" \
	"$(INTDIR)\PhoneNumberDlg.obj" \
	"$(INTDIR)\RunProgDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\trayicon.obj" \
	"$(INTDIR)\Afd.res"

"$(OUTDIR)\Afd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "Afd - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\Afd.exe" "$(OUTDIR)\Afd.bsc"


CLEAN :
	-@erase "$(INTDIR)\Afd.obj"
	-@erase "$(INTDIR)\Afd.pch"
	-@erase "$(INTDIR)\Afd.res"
	-@erase "$(INTDIR)\Afd.sbr"
	-@erase "$(INTDIR)\AfdDlg.obj"
	-@erase "$(INTDIR)\AfdDlg.sbr"
	-@erase "$(INTDIR)\AFDialPanel.obj"
	-@erase "$(INTDIR)\AFDialPanel.sbr"
	-@erase "$(INTDIR)\AlexfPerf.obj"
	-@erase "$(INTDIR)\AlexfPerf.sbr"
	-@erase "$(INTDIR)\FaceWnd.obj"
	-@erase "$(INTDIR)\FaceWnd.sbr"
	-@erase "$(INTDIR)\HyperLink.obj"
	-@erase "$(INTDIR)\HyperLink.sbr"
	-@erase "$(INTDIR)\IMapi.obj"
	-@erase "$(INTDIR)\IMapi.sbr"
	-@erase "$(INTDIR)\ModulVer.obj"
	-@erase "$(INTDIR)\ModulVer.sbr"
	-@erase "$(INTDIR)\Page1.obj"
	-@erase "$(INTDIR)\Page1.sbr"
	-@erase "$(INTDIR)\Page2.obj"
	-@erase "$(INTDIR)\Page2.sbr"
	-@erase "$(INTDIR)\Page3.obj"
	-@erase "$(INTDIR)\Page3.sbr"
	-@erase "$(INTDIR)\Page4.obj"
	-@erase "$(INTDIR)\Page4.sbr"
	-@erase "$(INTDIR)\Page5.obj"
	-@erase "$(INTDIR)\Page5.sbr"
	-@erase "$(INTDIR)\PhoneNumberDlg.obj"
	-@erase "$(INTDIR)\PhoneNumberDlg.sbr"
	-@erase "$(INTDIR)\RunProgDlg.obj"
	-@erase "$(INTDIR)\RunProgDlg.sbr"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\StdAfx.sbr"
	-@erase "$(INTDIR)\trayicon.obj"
	-@erase "$(INTDIR)\trayicon.sbr"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\Afd.bsc"
	-@erase "$(OUTDIR)\Afd.exe"
	-@erase "$(OUTDIR)\Afd.ilk"
	-@erase "$(OUTDIR)\Afd.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Afd.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\Afd.res" /d "_DEBUG" /d "AFX_RESOURCE_DLL" /d "AFX_TARG_NEU" /d "AFX_TARG_ENU" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\Afd.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Afd.sbr" \
	"$(INTDIR)\AfdDlg.sbr" \
	"$(INTDIR)\AFDialPanel.sbr" \
	"$(INTDIR)\AlexfPerf.sbr" \
	"$(INTDIR)\FaceWnd.sbr" \
	"$(INTDIR)\HyperLink.sbr" \
	"$(INTDIR)\IMapi.sbr" \
	"$(INTDIR)\ModulVer.sbr" \
	"$(INTDIR)\Page1.sbr" \
	"$(INTDIR)\Page2.sbr" \
	"$(INTDIR)\Page3.sbr" \
	"$(INTDIR)\Page4.sbr" \
	"$(INTDIR)\Page5.sbr" \
	"$(INTDIR)\PhoneNumberDlg.sbr" \
	"$(INTDIR)\RunProgDlg.sbr" \
	"$(INTDIR)\StdAfx.sbr" \
	"$(INTDIR)\trayicon.sbr"

"$(OUTDIR)\Afd.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=RASAPI32.LIB WINMM.LIB version.lib /nologo /subsystem:windows /incremental:yes /pdb:"$(OUTDIR)\Afd.pdb" /debug /machine:I386 /out:"$(OUTDIR)\Afd.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\Afd.obj" \
	"$(INTDIR)\AfdDlg.obj" \
	"$(INTDIR)\AFDialPanel.obj" \
	"$(INTDIR)\AlexfPerf.obj" \
	"$(INTDIR)\FaceWnd.obj" \
	"$(INTDIR)\HyperLink.obj" \
	"$(INTDIR)\IMapi.obj" \
	"$(INTDIR)\ModulVer.obj" \
	"$(INTDIR)\Page1.obj" \
	"$(INTDIR)\Page2.obj" \
	"$(INTDIR)\Page3.obj" \
	"$(INTDIR)\Page4.obj" \
	"$(INTDIR)\Page5.obj" \
	"$(INTDIR)\PhoneNumberDlg.obj" \
	"$(INTDIR)\RunProgDlg.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\trayicon.obj" \
	"$(INTDIR)\Afd.res"

"$(OUTDIR)\Afd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("Afd.dep")
!INCLUDE "Afd.dep"
!ELSE 
!MESSAGE Warning: cannot find "Afd.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "Afd - Win32 Release" || "$(CFG)" == "Afd - Win32 Debug"
SOURCE=.\Afd.cpp

"$(INTDIR)\Afd.obj"	"$(INTDIR)\Afd.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\Afd.rc

"$(INTDIR)\Afd.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\AfdDlg.cpp

"$(INTDIR)\AfdDlg.obj"	"$(INTDIR)\AfdDlg.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\AFDialPanel.cpp

"$(INTDIR)\AFDialPanel.obj"	"$(INTDIR)\AFDialPanel.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\AlexfPerf.cpp

"$(INTDIR)\AlexfPerf.obj"	"$(INTDIR)\AlexfPerf.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\FaceWnd.cpp

"$(INTDIR)\FaceWnd.obj"	"$(INTDIR)\FaceWnd.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\HyperLink.cpp

"$(INTDIR)\HyperLink.obj"	"$(INTDIR)\HyperLink.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\IMapi.cpp

"$(INTDIR)\IMapi.obj"	"$(INTDIR)\IMapi.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\ModulVer.cpp

"$(INTDIR)\ModulVer.obj"	"$(INTDIR)\ModulVer.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\Page1.cpp

"$(INTDIR)\Page1.obj"	"$(INTDIR)\Page1.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\Page2.cpp

"$(INTDIR)\Page2.obj"	"$(INTDIR)\Page2.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\Page3.cpp

"$(INTDIR)\Page3.obj"	"$(INTDIR)\Page3.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\Page4.cpp

"$(INTDIR)\Page4.obj"	"$(INTDIR)\Page4.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\Page5.cpp

"$(INTDIR)\Page5.obj"	"$(INTDIR)\Page5.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\PhoneNumberDlg.cpp

"$(INTDIR)\PhoneNumberDlg.obj"	"$(INTDIR)\PhoneNumberDlg.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\RunProgDlg.cpp

"$(INTDIR)\RunProgDlg.obj"	"$(INTDIR)\RunProgDlg.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "Afd - Win32 Release"

CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Afd.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\Afd.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "Afd - Win32 Debug"

CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\Afd.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\StdAfx.sbr"	"$(INTDIR)\Afd.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\trayicon.cpp

"$(INTDIR)\trayicon.obj"	"$(INTDIR)\trayicon.sbr" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\Afd.pch"



!ENDIF 


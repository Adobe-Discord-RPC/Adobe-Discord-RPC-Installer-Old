; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Adobe Discord RPC"
!define PRODUCT_VERSION "Public"
!define PRODUCT_PUBLISHER "ȭ��"
!define PRODUCT_WEB_SITE "http://hwahyang.space"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\adoberpc.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetFont "���� ����" 9
SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "banner.bmp"
;!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
!define MUI_WELCOMEFINISHPAGE_BITMAP "welcome.bmp"
;!define MUI_WELCOMEFINISHPAGE_BITMAP_NOSTRETCH
!define MUI_ICON "download.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
BrandingText "$(^Name) || Develop by. ȭ��"

; Splash Image
Function .onInit
  SetOutPath $TEMP
  File /oname=spl.bmp "spl.bmp"

  ; ü�� / �� / �ƿ�
  advsplash::show 2000 1800 1800 -1 $TEMP\spl

  Pop $0 ; $0 has '1' if the user closed the splash screen early,
         ; '0' if everything closed normally, and '-1' if some error occurred.
  Delete $TEMP\spl.bmp
FunctionEnd

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_PAGE_HEADER_TEXT "���� ����"
!define MUI_PAGE_HEADER_SUBTEXT "���ǿ� ���� �� �ּ���. ���Ǹ� �ϼž� ��ġ ������ �����մϴ�."
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "license.txt"
; Directory page
!define MUI_PAGE_HEADER_TEXT "��ġ ��� ����"
!define MUI_PAGE_HEADER_SUBTEXT "$(^Name)��(��) ��ġ �� ��θ� �����ϼ���."
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_PAGE_HEADER_TEXT "���� �޴� ����"
!define MUI_PAGE_HEADER_SUBTEXT "$(^Name)�� �ٷΰ��Ⱑ ��� �� ������ �����ϼ���."
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Adobe Discord RPC"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!define MUI_PAGE_HEADER_TEXT "��ġ ������"
!define MUI_PAGE_HEADER_SUBTEXT "$(^Name)��(��) ��ġ�ϰ� �ֽ��ϴ�. ��ø� ��ٸ�����."
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\start.bat"
!define MUI_FINISHPAGE_SHOWREADME "https://github.com/hwahyang1/Adobe-Discord-RPC/#readme"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!define MUI_PAGE_HEADER_TEXT "���� ������"
!define MUI_PAGE_HEADER_SUBTEXT "$(^Name)��(��) �����ϰ� �ֽ��ϴ�. ��ø� ��ٸ�����."
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Korean"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Adoberpc_installer.exe"
InstallDir "$PROGRAMFILES\Adobe Discord RPC_AfterFixed"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "Program" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  
  ; ���α׷� ����
  File "stop.req"
  DetailPrint "���α׷� ���Ḧ �õ��ϴ� ��..."
  ;nsProcess::KillProcess "adoberpc.exe" $R0
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  DetailPrint "���α׷� ���� ������ �����Ͽ� �߰� ���..."
  Sleep 3000
  
  ; �ھ� �� ����
  File "adoberpc.exe"
  File "adoberpc_monitor.exe"
  File "adoberpc_updater.exe"
  
  ; withconsole
  File "adoberpc_withconsole.exe"
  File "adoberpc_monitor_withconsole.exe"
  File "adoberpc_updater_withconsole.exe"
  
  ; ������ ��
  File "..\icon_alpha.ico"
  File "..\monitor.ico"
  File "..\update.ico"
  
  ; JSON
  File "..\pinfo.json"
  File "..\programver.json"
  
  ; ���� ��ġ����
  File "..\exit.bat"
  File "..\startup.bat"
  File "..\moveeeeeeeeee.bat"
  
  ; �ٷΰ���
  ;File "..\exit.lnk"
  CreateShortCut "$INSTDIR\exit.lnk" "$INSTDIR\exit.bat"
  ShellLink::SetShortCutDescription "$INSTDIR\exit.lnk" "Adobe Discord RPC ���α׷��� �����մϴ�."
  ShellLink::SetShortCutIconLocation "$INSTDIR\exit.lnk" "$INSTDIR\icon_alpha.ico"
  ShellLink::SetRunAsAdministrator "$INSTDIR\exit.lnk"
  ;File "..\startup.lnk"
  CreateShortCut "$INSTDIR\startup.lnk" "$INSTDIR\startup.bat"
  ShellLink::SetShortCutDescription "$INSTDIR\startup.lnk" "Adobe Discord RPC ���α׷��� �����մϴ�."
  ShellLink::SetShortCutIconLocation "$INSTDIR\startup.lnk" "$INSTDIR\icon_alpha.ico"
  ShellLink::SetRunAsAdministrator "$INSTDIR\startup.lnk"
  ;File "..\moveeeeeeeeee.lnk"
  CreateShortCut "$INSTDIR\moveeeeeeeeee.lnk" "$INSTDIR\moveeeeeeeeee.bat"
  ShellLink::SetShortCutIconLocation "$INSTDIR\moveeeeeeeeee.lnk" "$INSTDIR\update.ico"
  ShellLink::SetRunAsAdministrator "$INSTDIR\moveeeeeeeeee.lnk"
  
  ; ���� ����
  Delete "$INSTDIR\stop.req"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\���α׷� ����.lnk" "$INSTDIR\startup.lnk"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\���α׷� ����.lnk" "$INSTDIR\exit.lnk"
  CreateShortCut "$DESKTOP\Adobe Discord RPC ����.lnk" "$INSTDIR\startup.lnk"
  CreateShortCut "$DESKTOP\Adobe Discord RPC ����.lnk" "$INSTDIR\exit.lnk"
  CreateShortCut "$DESKTOP\Adobe Discord RPC ������Ʈ.lnk" "$INSTDIR\adoberpc_updater.exe"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\���α׷� �ȳ�.lnk" "https://github.com/hwahyang1/Adobe-Discord-RPC#readme"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\���α׷� ������Ʈ.lnk" "$INSTDIR\adoberpc_updater.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\���α׷� ����.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$SMSTARTUP\Run Adobe Discord RPC.lnk" "$INSTDIR\start.bat"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\adoberpc.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\adoberpc.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)��(��) �����Ͽ����ϴ�.$\n�Ϻ� ������ ���� �����ؾ� �� ���� �ֽ��ϴ�."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "������ $(^Name)��(��) �����Ͻðڽ��ϱ�?$\n�� ������ ��� �� �� �����ϴ�." IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  ; ���α׷� ����
  File "stop.req"
  DetailPrint "���α׷� ���Ḧ �õ��ϴ� ��..."
  ;nsProcess::KillProcess "adoberpc.exe" $R0
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  Sleep 500
  KillProcDLL::KillProc "adoberpc_monitor.exe"
  KillProcDLL::KillProc "adoberpc.exe"
  DetailPrint "���α׷� ���� ������ �����Ͽ� �߰� ���..."
  Sleep 3000

  ; �ھ� �� ����
  Delete "$INSTDIR\adoberpc.exe"
  Delete "$INSTDIR\adoberpc_monitor.exe"
  Delete "$INSTDIR\adoberpc_updater.exe"
  
  ; withconsole
  Delete "$INSTDIR\adoberpc_withconsole.exe"
  Delete "$INSTDIR\adoberpc_monitor_withconsole.exe"
  Delete "$INSTDIR\adoberpc_updater_withconsole.exe"

  ; ������ ��
  Delete "$INSTDIR\icon_alpha.ico"
  Delete "$INSTDIR\monitor.ico"
  Delete "$INSTDIR\update.ico"

  ; JSON
  Delete "$INSTDIR\pinfo.json"
  Delete "$INSTDIR\programver.json"

  ; ���� ��ġ����
  Delete "$INSTDIR\exit.bat"
  Delete "$INSTDIR\startup.bat"
  Delete "$INSTDIR\moveeeeeeeeee.bat"
  
  ; �ٷΰ���
  Delete "$INSTDIR\exit.lnk"
  Delete "$INSTDIR\startup.lnk"
  Delete "$INSTDIR\moveeeeeeeeee.lnk"
  
  ; ���� ����
  Delete "$INSTDIR\stop.req"
  
  ;  ���ν��緯
  Delete "$INSTDIR\uninst.exe"

  ; �������α׷� �ٷΰ��� ��
  Delete "$SMPROGRAMS\$ICONS_GROUP\���α׷� ����.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\���α׷� ����.lnk"
  Delete "$DESKTOP\Adobe Discord RPC ����.lnk"
  Delete "$DESKTOP\Adobe Discord RPC ����.lnk"
  Delete "$DESKTOP\Adobe Discord RPC ������Ʈ.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\���α׷� �ȳ�.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\���α׷� ������Ʈ.lnk"
  Delete "$SMSTARTUP\Run Adobe Discord RPC.lnk"

  ; ����
  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR"

  ; ���� ��
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
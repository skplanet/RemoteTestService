; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
;!define PRODUCT_BIN "RedeconA.exe"
;!define PRODUCT_OUT "..\Redecon"
!define PRODUCT_NAME "RedeconAgent"
!define PRODUCT_VERSION "1.0.4.1"
!define PRODUCT_PUBLISHER "SKPlanet"
!define PRODUCT_WEB_SITE "http://www.SKPlanet.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_BIN}"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"

!define PRODUCT_CLASSES_ROOT_KEY "HKCR"
!define PRODUCT_UNINST_ROOT_KEY "HKCU"



; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT_BIN}"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Korean"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${PRODUCT_OUT}\${PRODUCT_NAME}.${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}"
;InstallDirRegKey HKCU "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
BrandingText "SK planet"

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer

  File "${PRODUCT_OUT}\${PRODUCT_BIN}"

  SetShellVarContext all

CreateDirectory "$SMPROGRAMS\Redecon"
CreateShortCut "$SMPROGRAMS\Redecon\RedeconA.lnk" "$INSTDIR\${PRODUCT_BIN}"
CreateShortCut "$DESKTOP\RedeconA.lnk" "$INSTDIR\${PRODUCT_BIN}"

File "${PRODUCT_OUT}\ruicmd.exe"
File "${PRODUCT_OUT}\ruicapsvc"
File "${PRODUCT_OUT}\ruicapsvcj1"
File "${PRODUCT_OUT}\ruicapsvcj2"
File "${PRODUCT_OUT}\libiomp5md.dll"
File "${PRODUCT_OUT}\com.rocode.skrc"
File "${PRODUCT_OUT}\AdbWinUsbApi.dll"
File "${PRODUCT_OUT}\AdbWinApi.dll"
;File "${PRODUCT_OUT}\TCOCX.OCX"

  CreateDirectory "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\AppInst"
  CreateDirectory "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\temp"

SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\Redecon\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"

SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name)는(은) 완전히 제거되었습니다."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "$(^Name)을(를) 제거하시겠습니까?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
;  UnRegDLL "$INSTDIR\TCOCX.OCX"

SetShellVarContext all
  Delete "$DESKTOP\RedeconA.lnk"
  Delete "$SMPROGRAMS\Redecon\Uninstall.lnk" 
  Delete "$SMPROGRAMS\Redecon\RedeconA.lnk"

  Delete "$INSTDIR\uninst.exe"

  Delete "$INSTDIR\AdbWinApi.dll"
  Delete "$INSTDIR\AdbWinUsbApi.dll"
  Delete "$INSTDIR\com.rocode.skrc"
  Delete "$INSTDIR\libiomp5md.dll"
;Delete "$INSTDIR\TCOCX.OCX"

  Delete "$INSTDIR\ruicapsvc"
  Delete "$INSTDIR\ruicapsvcj1"
  Delete "$INSTDIR\ruicapsvcj2"
  Delete "$INSTDIR\ruicmd.exe"
  Delete "$INSTDIR\${PRODUCT_BIN}"
  
  Delete "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\ta.ini"
  Delete "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\log\log.txt"

  RMDir "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\AppInst"
  RMDir "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\temp"
  RMDir "$PROGRAMFILES\SKPlanet\${PRODUCT_NAME}\log"
  
  RMDir "$SMPROGRAMS\Redecon"
  
  RMDir "$INSTDIR"

 
  
  SetAutoClose true
SectionEnd

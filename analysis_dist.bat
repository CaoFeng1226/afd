REM ############################## 通用环境设置 ######################################
REM #
REM #  这部分内容，各个项目相同，一般情况下不需修改
REM #
REM ################################################################################

REM ## Jenkins Server 主机名
set JenkinsServerName=vwinxp

REM ## Klocwork server
set KlocworkProjectServerHost=vwinxp

REM ## Klocwork ProjectServer Port
set KlocworkProjectServerPort=8090

REM ## Klocwork LicenseServer Host
set KlocworkLicenseServerHost=haojc-PC

REM ## Klocwork LicenseServer Port
set KlocworkLicenseServerPort=27000

REM ## Klocwork projects_root dir
set KlocworkProjectsRoot="C:/Data/projects_root10"

REM ## Klocwork 脚本目录
set KlocworkScriptsPath=C:/Klocwork/K11_CI/perl/windows

REM ############################## 项目设置 ######################################
REM #
REM #  设置项目的运行模式和属性。
REM #
REM #############################################################################

REM ## 调试用
REM set ProjectPath=d:/work/afdialer

REM ## Jenkins中job的名称，一般不修改。
REM ## set ProjectName=%JOB_NAME%
REM ## 调试用
set ProjectName=afd1
REM ## Jenkins执行时，项目目录，一般是workspace目录的上一级(workspace下放源代码)。避免将项目目录作为源代码编译的目录，因为项目目录下会存放新生成的报告文件，从而引起代码变更。
set ProjectPath=%WORKSPACE%/../%ProjectName%_kw_log

REM ## SCM 的类型，取值 svn，或者firefly
set SCM=svn
REM #SCM=firefly

REM ## Jenkins执行时，build和Klocwork分析在此目录下执行
set SourcePath=%WORKSPACE%

REM ## Jenkins 项目的说明，可包括中文、符号等任意字符
set ProjectDescription=afdialer

REM ## 项目运行模式：0=正常运行；1=只发邮件给抄送者；2=不发邮件
set RunningMode=2

REM ## Klocwork 分析时采用的并发线程数量(cpu core/thread) 1==>10
set JobNumber=5

REM ## Klocwork项目名称：默认为与Jenkins项目的项目名相同，不能包含中文，符号仅支持下划线 -->
set KlocworkProjectName=%ProjectName%

REM ## Klocwork: Source Language: c,cxx,java,csharp
set SourceLanguage=c,cxx

REM ## Klocwork: Source Encoding: UTF-8, GBK, GB2312, US-ASCII, ISO-8859-1
set SourceEncoding=UTF-8

REM ## Klocwork Clean Command
REM # CleanCommand=make clean
REM # CleanCommand=mvn clean
REM # CleanCommand=bjam clean debug

REM ## Klocwork Make Command: 双引号(")转译：&quot  perl脚本自动将单引号(')替换为双引号
REM # KlocworkMakeCommand=kwinject make all
REM # KlocworkMakeCommand=mvn ant:ant & kwant -f maven-build.xml
set KlocworkMakeCommand="kwvcprojparser afd.vcxproj -c 'Debug|Win32' -o kwinject.out"

REM ############################## 邮件通知设置 ######################################
REM #
REM #  设置项目的运行模式和属性。
REM #
REM #############################################################################

REM ## Email Domain
set EmailDomain=cybersoftek.com
REM ## Email Smtp server
set EmailSmtp=smtp.ym.163.com
REM ## EmailSender
set EmailSender=haojiancai@cybersoftek.com
REM ## EmailAuthUserID
set EmailAuthUserID=haojiancai@cybersoftek.com
REM ## EmailAuthUserPassword
set EmailAuthUserPassword=iaCnaI824

REM ## 邮件抄送地址：为带邮件域名的完整邮件地址，用英文逗号(,)分隔，脚本不对抄送地址做任何处理
set CCEmailAddress=haojc@cybersoftek.com
REM ## 邮件拒绝用户名：为不带邮件域名的用英文逗号(",")分隔的用户名，"*"表示全部用户名。脚本据此会对邮件收件人（来自于源代码的Owner）进行过滤处理
set RejectEmailName=

perl "%KlocworkScriptsPath%/analysis.pl" %JenkinsServerName%;%SCM%;%KlocworkProjectServerHost%;%KlocworkProjectServerPort%;%KlocworkLicenseServerHost%;%KlocworkLicenseServerPort%;%EmailDomain%;%EmailSmtp%;%EmailSender%;%EmailAuthUserID%;%EmailAuthUserPassword%;%RunningMode%;%JobNumber%;%ProjectName%;%ProjectDescription%;%KlocworkProjectName%;%KlocworkScriptsPath%;%ProjectPath%;%SourcePath%;%SourceLanguage%;%SourceEncoding%;%CleanCommand%;%KlocworkMakeCommand%;%CCEmailAddress%;%RejectEmailName%;%KlocworkProjectsRoot%;END

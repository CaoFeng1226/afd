REM ############################## ͨ�û������� ######################################
REM #
REM #  �ⲿ�����ݣ�������Ŀ��ͬ��һ������²����޸�
REM #
REM ################################################################################

REM ## Jenkins Server ������
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

REM ## Klocwork �ű�Ŀ¼
set KlocworkScriptsPath=C:/Klocwork/K11_CI/perl/windows

REM ############################## ��Ŀ���� ######################################
REM #
REM #  ������Ŀ������ģʽ�����ԡ�
REM #
REM #############################################################################

REM ## ������
REM set ProjectPath=d:/work/afdialer

REM ## Jenkins��job�����ƣ�һ�㲻�޸ġ�
REM ## set ProjectName=%JOB_NAME%
REM ## ������
set ProjectName=afd1
REM ## Jenkinsִ��ʱ����ĿĿ¼��һ����workspaceĿ¼����һ��(workspace�·�Դ����)�����⽫��ĿĿ¼��ΪԴ��������Ŀ¼����Ϊ��ĿĿ¼�»��������ɵı����ļ����Ӷ������������
set ProjectPath=%WORKSPACE%/../%ProjectName%_kw_log

REM ## SCM �����ͣ�ȡֵ svn������firefly
set SCM=svn
REM #SCM=firefly

REM ## Jenkinsִ��ʱ��build��Klocwork�����ڴ�Ŀ¼��ִ��
set SourcePath=%WORKSPACE%

REM ## Jenkins ��Ŀ��˵�����ɰ������ġ����ŵ������ַ�
set ProjectDescription=afdialer

REM ## ��Ŀ����ģʽ��0=�������У�1=ֻ���ʼ��������ߣ�2=�����ʼ�
set RunningMode=2

REM ## Klocwork ����ʱ���õĲ����߳�����(cpu core/thread) 1==>10
set JobNumber=5

REM ## Klocwork��Ŀ���ƣ�Ĭ��Ϊ��Jenkins��Ŀ����Ŀ����ͬ�����ܰ������ģ����Ž�֧���»��� -->
set KlocworkProjectName=%ProjectName%

REM ## Klocwork: Source Language: c,cxx,java,csharp
set SourceLanguage=c,cxx

REM ## Klocwork: Source Encoding: UTF-8, GBK, GB2312, US-ASCII, ISO-8859-1
set SourceEncoding=UTF-8

REM ## Klocwork Clean Command
REM # CleanCommand=make clean
REM # CleanCommand=mvn clean
REM # CleanCommand=bjam clean debug

REM ## Klocwork Make Command: ˫����(")ת�룺&quot  perl�ű��Զ���������(')�滻Ϊ˫����
REM # KlocworkMakeCommand=kwinject make all
REM # KlocworkMakeCommand=mvn ant:ant & kwant -f maven-build.xml
set KlocworkMakeCommand="kwvcprojparser afd.vcxproj -c 'Debug|Win32' -o kwinject.out"

REM ############################## �ʼ�֪ͨ���� ######################################
REM #
REM #  ������Ŀ������ģʽ�����ԡ�
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

REM ## �ʼ����͵�ַ��Ϊ���ʼ������������ʼ���ַ����Ӣ�Ķ���(,)�ָ����ű����Գ��͵�ַ���κδ���
set CCEmailAddress=haojc@cybersoftek.com
REM ## �ʼ��ܾ��û�����Ϊ�����ʼ���������Ӣ�Ķ���(",")�ָ����û�����"*"��ʾȫ���û������ű��ݴ˻���ʼ��ռ��ˣ�������Դ�����Owner�����й��˴���
set RejectEmailName=

perl "%KlocworkScriptsPath%/analysis.pl" %JenkinsServerName%;%SCM%;%KlocworkProjectServerHost%;%KlocworkProjectServerPort%;%KlocworkLicenseServerHost%;%KlocworkLicenseServerPort%;%EmailDomain%;%EmailSmtp%;%EmailSender%;%EmailAuthUserID%;%EmailAuthUserPassword%;%RunningMode%;%JobNumber%;%ProjectName%;%ProjectDescription%;%KlocworkProjectName%;%KlocworkScriptsPath%;%ProjectPath%;%SourcePath%;%SourceLanguage%;%SourceEncoding%;%CleanCommand%;%KlocworkMakeCommand%;%CCEmailAddress%;%RejectEmailName%;%KlocworkProjectsRoot%;END

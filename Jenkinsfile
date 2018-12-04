node {
    build_afd()
}

def build_afd(){
    dir("afd"){
		stage ('Checkout afd'){
			checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'c350ac4d-e4e0-43b0-b273-8ebbb7b8fc92', url: 'https://gitee.com/liangsword/afd.git']]])
		}
		stage ('Build afd'){
			build()
		}
		stage ('Klocwork scan'){
		    kwscan()
		}
		stage ('Klocwork load'){
		    kwload()
		}		
    }
}

def build(){
    bat 'kwinject -o kwinject.out "C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\IDE\\devenv.com" "afd.sln" /Rebuild'
}

def kwscan() {
    bat 'kwbuildproject --url http://haojcpc:8090/afd -f -o table kwinject.out'
}

def kwload() {
	bat 'kwadmin --url http://haojcpc:8090 load afd table'
}
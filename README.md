# my_app
 Virtual Environments

                python3 -m venv .devops
                source .devops/bin/activate
                pip3 install --upgrade boto3
                sudo apt install unzip

Install kubectl

            sudo curl --silent --location -o /usr/local/bin/kubectl \
            https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl

            sudo chmod +x /usr/local/bin/kubectl

Update awscli

            curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
            unzip awscliv2.zip
            sudo ./aws/install

Install jq, envsubst (from GNU gettext utilities) and bash-completion

        sudo apt -y install jq gettext bash-completion moreutils


Enable kubectl bash_completion

        kubectl completion bash >>  ~/.bash_completion
        . /etc/profile.d/bash_completion.sh
        . ~/.bash_completion

        java -version
        openjdk version "1.8.0_292"
        OpenJDK Runtime Environment (build 1.8.0_292-8u292-b10-0ubuntu1~20.04-b10)
        OpenJDK 64-Bit Server VM (build 25.292-b10, mixed mode)

        sudo apt install openjdk-11-jdk -y

        java -version

        openjdk version "11.0.11" 2021-04-20
        OpenJDK Runtime Environment (build 11.0.11+9-Ubuntu-0ubuntu2.20.04)
        OpenJDK 64-Bit Server VM (build 11.0.11+9-Ubuntu-0ubuntu2.20.04, mixed mode, sharing)
# Big-IP Lab Environment



The targeted goal of this repository is to create F5 Lab environment (as found in vLab section under https://downloads.f5.com/) in AWS using CloudFormation template.

The diagram below depicts the Logical Network Diagram built by the CloudFormation templates in this repository.
![Logical Network Diagram](Figures/LogicalNetworkDiagram.png)



The default values in the CloudFormation templates were designed to work in AWS Region Singapore (`ap-southeast-1`).
The reason of that is because the adapted LAMPv7 and Windows Server 2008 R2 VMs are only imported to AWS Region Singapore, so the adapted LAMPv7 and Windows Server 2008 R2 AMIs exist only in AWS Region Singapore.
To make the templates work in any other AWS Regions, the adapted LAMPv7 and Windows Server 2008 R2 AMIs must exist in the targeted region and be accessible by the targeted account, before the execution of the template.
Which can be achieved by re-importing the adapted LAMPv7 and Windows Server 2008 R2 VMs, or by copying the adapted LAMPv7 and Windows Server 2008 R2 AMIs in Singapore to the targeted AWS Region.
Once the adapted LAMPv7 and Windows Server 2008 R2 AMIs exist in the targeted AWS Region, the AMI ID of the adapted LAMPv7 and Windows Server 2008 R2 need to be indicated properly (i.e. not using the default value) during execution of the template.

The Big-IP AMI should be available in most (if not ALL) of AWS Regions as part of F5 Networks effort to sell usage of the product in AWS.
Only the correct AMI ID of Big-IP within the targeted AWS Region is needed, which should not be difficult to find.
You will also need a valid F5 Big-IP License to execute the template and having a running Big-IP Instance.

Note that the CloudFormation templates were tested with various version of Big-IP, from version 15.0.1 build 0.0.11 to version 15.1.2.1 build 0.0.10, depending on when the template was created.
The sections below starts from the first time the template was created. When the template was updated (i.e. by adding features) another section was added below the previous one.
So with the time, naturally the template on the first few sections will be out-dated and MAY not work.

This CloudFormation template is designed for building Demo/Testing environment only. It was NOT designed to be used for Live/Commercial environment!

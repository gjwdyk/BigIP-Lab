# Big-IP Lab Environment



The target goal of this repository is to automate the creation of F5 Lab environment (as found in vLab section under https://downloads.f5.com/) in AWS using CloudFormation template.

The diagram below depicts the Logical Network Diagram built by the CloudFormation templates in this repository.
![Logical Network Diagram](Figures/LogicalNetworkDiagram.png)

At the moment, the default values in this CloudFormation templates were designed to work in only in AWS Region Tokyo, Seoul and Singapore (`ap-northeast-1`, `ap-northeast-2` and `ap-southeast-1`).
The reason of that is because the adapted LAMPv7 and Windows Server 2008 R2 VMs are only imported to AWS Region Tokyo, Seoul and Singapore; so the adapted LAMPv7 and Windows Server 2008 R2 AMIs exist only in those AWS Regions.
To make the template works in any other AWS Regions, the adapted LAMPv7 and Windows Server 2008 R2 AMIs must exist in the targeted region and be accessible by the targeted account, before the execution of the template.
Which can be achieved by re-importing the adapted LAMPv7 and Windows Server 2008 R2 VMs, or by copying the adapted LAMPv7 and Windows Server 2008 R2 AMIs in Tokyo, Seoul or Singapore to the targeted other AWS Region.
Once the adapted LAMPv7 and Windows Server 2008 R2 AMIs exist in the targeted AWS Region, the AMI ID of the adapted LAMPv7 and Windows Server 2008 R2 need to be indicated properly (i.e. not using the default value) during execution of the template.

The Big-IP AMI should be available in most (if not ALL) of AWS Regions as part of F5 Networks effort to commercialized usage of the product in AWS.
Only the correct AMI ID of Big-IP within the targeted AWS Region is needed, which should not be difficult to find. This template already has default values for Big-IP AMI ID in most AWS Regions.
You will also need a valid F5 Big-IP License to execute the template and having a running Big-IP Instance.

Note that the CloudFormation templates were tested with Big-IP version 15.1.2.1 build 0.0.10.

This CloudFormation template is designed for building Demo/Testing environment only. It was NOT designed to be used for Live/Commercial environment !!!



***

## Template Parameters

<br>
<a href="https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-1#/stacks/new?stackName=BigIP-Lab&templateURL=https://aws-f5-singapore-hc-demo-bucket-files.s3-ap-southeast-1.amazonaws.com/CF/CF_BigIP_Lab_AS3.25_TMSH_UpGrade_Region_Original.json"><img align="right" src="https://github.com/gjwdyk/BigIP-Lab/raw/main/Figures/LaunchStackJigokuShoujo.png" width="140" height="22"/></a>
<br>

After clicking the "Launch Stack" button above, you need to specify input parameters to the CloudFormation stack (better to do right click and open link in new tab, you can refer back to the below table).

| CFT Label | Parameter Name | Required | Description |
| --- | --- | --- | --- |
| Stack Name | Stack Name | Mandatory and Unique Across Account | Give a unique name to the CloudFormation stack. Stack name will be used to prefix all resources created by this CloudFormation template. Stack name can include letters (A-Z and a-z), numbers (0-9), and dashes (-). |
| PreFix for Name Tags | TagPreFix | Optional | Give a Prefix to be used for Prefix-Naming all resources created by this CloudFormation template. In an account where there are multiple users, using initial will help to identify who owns the resources which this CloudFormation template creates. |
| Big-IP Image ID | BigIPImageID | Mandatory with Default Value | Default value uses "AllTwoBootLocations" versions of Big-IP AMI ID excerpt from [F5 Networks' AWS CloudFormation GitHub Repository](https://github.com/F5Networks/f5-aws-cloudformation/blob/master/supported/standalone/n-nic/existing-stack/byol/f5-existing-stack-byol-n-nic-bigip.template) reference. Unless a custom Big-IP AMI ID is required, generally use "Default" value should be OK. |
| Big-IP Instance Type | BigIPInstanceType | Mandatory with Default Value | Select an EC2 Instance Type for the Big-IP instance. Note that instance type also influence the number of network interfaces and IP addresses which can be assigned into the instance. Refer to section [IP addresses per network interface per instance type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html) for more details. Selecting too small instance type may hinder the CloudFormation to work as expected. |
| CFT Label | Parameter Name | Required | Description |






<a href="https://console.aws.amazon.com/cloudformation/home?region=ap-southeast-1#/stacks/new?stackName=BigIP-Lab&templateURL=https://aws-f5-singapore-hc-demo-bucket-files.s3-ap-southeast-1.amazonaws.com/CF/CF_BigIP_Lab_AS3.25_TMSH_UpGrade_Region.json"><img src="https://github.com/gjwdyk/BigIP-Lab/raw/main/Figures/JigokuShoujoLaunchStack.png" width="140" height="22"/></a>



# VM Import

This section does not intent to provide full guide of importing VM into AWS, which can be referred at [Importing a VM as an image using VM Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html), but only to supply additional information and/or samples not covered at the reference.

***

As per stated in the [Importing a VM as an image using VM Import/Export](https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html) reference, importing VM image to AWS requires Open Virtualization Archive (OVA) format.

If you are using VMware WorkStation (especially version 15 or later), this can be achieved by `Export to OVF...` menu.

![VMwareWorkStation-ExportToOVF.png](VMwareWorkStation-ExportToOVF.png)

Then simply input proper file name and ***change*** the extension from `.ovf` to `.ova`. The system will then save the exported image in `.ova` format.

![VMwareWorkStation-ExportToOVF-FileNameExtension.png](VMwareWorkStation-ExportToOVF-FileNameExtension.png)

***

`vmimport` role's inline policy at AWS IAM :

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::aws-s3-vmimport-bucket",
                "arn:aws:s3:::aws-s3-vmimport-bucket/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:PutObject",
                "s3:GetBucketAcl"
            ],
            "Resource": [
                "arn:aws:s3:::aws-s3-vmexport-bucket",
                "arn:aws:s3:::aws-s3-vmexport-bucket/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:ModifySnapshotAttribute",
                "ec2:CopySnapshot",
                "ec2:RegisterImage",
                "ec2:Describe*"
            ],
            "Resource": "*"
        }
    ]
}
```

You need to change the AWS S3 bucket names (`aws-s3-vmimport-bucket` and `aws-s3-vmexport-bucket` on the example above), to your own import/export bucket names.

The `vmimport` role is pretty static i.e. does not need to change from importing an image to another image, as long as you keep using the same AWS S3 import/export buckets.

***

`trust-policy.json` file at local storage :

```
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Principal": { "Service": "vmie.amazonaws.com" },
         "Action": "sts:AssumeRole",
         "Condition": {
            "StringEquals":{
               "sts:Externalid": "vmimport"
            }
         }
      }
   ]
}
```

The `trust-policy.json` file is pretty static i.e. does not need to change from importing an image to another image, assuming you keep using the same IAM Role for the VM import/export (i.e. `vmimport` role in the example).

***

`role-policy.json` file at local storage :

```
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "s3:GetBucketLocation",
            "s3:GetObject",
            "s3:ListBucket" 
         ],
         "Resource":[
            "arn:aws:s3:::aws-s3-vmimport-bucket",
            "arn:aws:s3:::aws-s3-vmimport-bucket/*"
         ]
      },
      {
         "Effect":"Allow",
         "Action":[
            "s3:GetBucketLocation",
            "s3:GetObject",
            "s3:ListBucket",
            "s3:PutObject",
            "s3:GetBucketAcl"
         ],
         "Resource":[
            "arn:aws:s3:::aws-s3-vmexport-bucket",
            "arn:aws:s3:::aws-s3-vmexport-bucket/*"
         ]
      },
      {
         "Effect":"Allow",
         "Action":[
            "ec2:ModifySnapshotAttribute",
            "ec2:CopySnapshot",
            "ec2:RegisterImage",
            "ec2:Describe*"
         ],
         "Resource":"*"
      }
   ]
}
```

You need to change the AWS S3 bucket names (`aws-s3-vmimport-bucket` and `aws-s3-vmexport-bucket` on the example above), to your own import/export bucket names.

The `role-policy.json` file is pretty static i.e. does not need to change from importing an image to another image, as long as you keep using the same AWS S3 import/export buckets.

***

`containers.json` file at local storage :






***

<br><br><br>
```
╔═╦═════════════════╦═╗
╠═╬═════════════════╬═╣
║ ║ End of Document ║ ║
╠═╬═════════════════╬═╣
╚═╩═════════════════╩═╝
```
<br><br><br>



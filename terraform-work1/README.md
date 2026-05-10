# terraform-work1

Terraform を使って Azure のリソースグループと仮想ネットワークを作成するサンプルです。

詳細な作業メモは [work1-readme.md](work1-readme.md) にまとめています。

## 使い方

Azure サブスクリプション ID を `TF_VAR_subscription_id` または `ARM_SUBSCRIPTION_ID` で指定してから Terraform を実行します。

```powershell
$env:TF_VAR_subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
terraform init
terraform plan
```

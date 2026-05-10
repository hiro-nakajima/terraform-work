# terraform-work

Terraform 学習用の作業フォルダ集です。`terraform-work1` から `terraform-work7` まで、Azure リソースの作成、参照、インポート、既存環境の取り込みなどを段階的に試した内容をまとめています。

このリポジトリの内容は、2025年1月時点の Terraform / AzureRM Provider / Azure Portal の挙動を前提にしています。

## フォルダ構成

| フォルダ | 内容 |
| --- | --- |
| `terraform-work1` | Azure リソースグループと仮想ネットワークを Terraform で作成する基本サンプル |
| `terraform-work2` | 変数、出力値、複数リソース構成を扱う Terraform サンプル |
| `terraform-work3` | tfstate や出力値を使った構成管理の確認 |
| `terraform-work4` | 既存 Azure リソースの import を試す作業メモ |
| `terraform-work5` | import ブロックを使った既存リソース取り込みの作業メモ |
| `terraform-work6` | aztfexport を使った既存 Azure 環境の Terraform 化 |
| `terraform-work7` | Azure Application Gateway など、追加構成を含む Terraform 作業メモ |

各フォルダの詳しい手順やスクリーンショットは、それぞれの `work*-readme.md` を参照してください。

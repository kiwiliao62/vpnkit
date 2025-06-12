# 修改记录:
# 1. 保留两个平台（避免工作流验证失败）
# 2. 添加 export-binary 目标用于导出文件

group "default" {
  targets = ["bin-image", "export-binary"]
}

target "docker-metadata-action" {}

target "bin-image" {
  target = "binary"
  output = ["type=image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"  # 保留此平台以通过工作流验证
  ]
}

target "export-binary" {
  target = "export"
  output = ["type=local,dest=./dist"]
  platforms = [
    "linux/amd64",
    "linux/arm64"  # 保留此平台以通过工作流验证
  ]
}

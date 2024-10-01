# Protocol Buffersのコンパイル用Makefile

# protoファイルのディレクトリ
PROTO_DIR = .
# 出力先ディレクトリ
OUT_DIR = .

# protocコマンドのオプションを設定
PROTOC_GEN_GO = --go_out=$(OUT_DIR) --go_opt=paths=source_relative
# デフォルトターゲット: すべてのprotoファイルをコンパイル
all: compile

# コンパイルターゲット
compile:
	@protoc $(PROTOC_GEN_GO) $(PROTO_DIR)/*.proto
	@echo "Protoファイルのコンパイルが完了しました。"

# クリーンアップターゲット: 生成されたGoファイルを削除
clean:
	@rm -f $(OUT_DIR)/*.pb.go
	@echo "生成されたファイルを削除しました。"

# ヘルプを表示
help:
	@echo "使用可能なコマンド:"
	@echo "  make all      - すべてのprotoファイルをコンパイルします"
	@echo "  make clean    - 生成されたGoコードを削除します"
	@echo "  make help     - このヘルプメッセージを表示します"

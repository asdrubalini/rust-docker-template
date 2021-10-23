image:
	cargo build --target x86_64-unknown-linux-musl --release
	strip target/x86_64-unknown-linux-musl/release/rust-docker-template
	docker build -t rust-docker-template .
	docker save rust-docker-template -o image.tar

load:
	docker load -i image.tar

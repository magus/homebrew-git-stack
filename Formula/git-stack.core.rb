require "language/node"

class GitStackCore < Formula
  version = "1.6.0"

  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  url "https://registry.npmjs.org/git-stack-cli/-/git-stack-cli-#{version}.tgz"
  mirror "https://github.com/magus/git-stack-cli/releases/download/#{version}/git-stack-cli-#{version}.tgz"
  sha256 "0f3ef1b2951f2c1fb4c63e8c24c97971cb5bf873ec8f6fe49b1411afcff1b06b"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node@18"

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    system "npm", "install", "--production=false", *Language::Node.local_npm_install_args

    target = if OS.mac?
      "node18-macos-x64"
    elsif OS.linux?
      "node18-linux-x64"
    end

    system "npm", "run", "build:standalone", "--", target

    bin.install "dist/standalone/git-stack-cli" => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end

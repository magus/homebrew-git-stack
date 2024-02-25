require "language/node"

class GitStackCore < Formula
  version = "1.2.2"

  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  url "https://registry.npmjs.org/git-stack-cli/-/git-stack-cli-#{version}.tgz"
  mirror "https://github.com/magus/git-stack-cli/releases/download/#{version}/git-stack-cli-#{version}.tgz"
  sha256 "533f13684379917f3ef36e0ca4ba55306d0620b9c4fc79dca106c81eeadf8271"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node@18"

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

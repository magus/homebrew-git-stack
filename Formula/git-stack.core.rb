require "language/node"

class GitStackCore < Formula
  version = "2.1.1-beta"

  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  url "https://registry.npmjs.org/git-stack-cli/-/git-stack-cli-#{version}.tgz"
  mirror "https://github.com/magus/git-stack-cli/releases/download/#{version}/git-stack-cli-#{version}.tgz"
  sha256 "fbe8bfd53ab8ae7ecf6ddd316b4a9bf8c147f0b3745187dc03de21f4496c28b1"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node@22"

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    system "npm", "install", *Language::Node.local_npm_install_args

    target = if OS.mac?
      "bun-darwin-x64"
    elsif OS.linux?
      "bun-linux-x64"
    end

    system "npm", "run", "compile", "--target=#{target}"

    bin.install "dist/bin/git-stack-#{target}" => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end

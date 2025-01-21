class GitStackAT201beta < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.0.1-beta"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.0.1-beta/git-stack-bun-darwin-arm64.zip"
      sha256 "4ed933185d12e5f23376adc23a611da2cbdd3529c0de23907a4a48b3181cf1cb"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.0.1-beta/git-stack-bun-darwin-x64.zip"
      sha256 "90c31ea7ba217984d30952fa670a192c9afaed06dcf9797f73221406e425f756"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.0.1-beta/git-stack-bun-linux-x64.zip"
    sha256 "645ebcd5b1f791bd5491e332ea84442642b11c05651b66fc2e48486e0ba1c973"

    def filename
      "git-stack-bun-linux-x64.zip"
    end
  else
    odie "Unsupported platform. Please submit a bug report here: https://github.com/magus/git-stack-cli/issues\n#{OS.report}"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    binary_name = filename.sub(/\.zip$/, "")
    bin.install binary_name => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end

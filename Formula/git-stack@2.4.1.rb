class GitStackAT241 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.4.1"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.4.1/git-stack-bun-darwin-arm64.zip"
      sha256 "68a55cbde4a6f1c1b517f5869db40b22f7dfa9ef8b7482c4dbd185b5e74f6c99"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.4.1/git-stack-bun-darwin-x64.zip"
      sha256 "e7b80d79bd8a34823c3a5eb7dd4f0a2c51ce9c4b229711c977320ba727829d59"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.4.1/git-stack-bun-linux-x64.zip"
    sha256 "6dc69968d26d923be8d6a1041966df5d611cb5f101bc486a1b0d1b7dd6f96c92"

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

class Geekcode < Formula
  include Language::Python::Virtualenv

  desc "Filesystem-driven AI agent for knowledge work"
  homepage "https://github.com/sur950/GeekCode"
  url "https://github.com/sur950/GeekCode/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e9db87b60a18ae94edc1f6c31849d8dbf223d1aec8164e68a533dd810e030658"
  license "Apache-2.0"
  head "https://github.com/sur950/GeekCode.git", branch: "main"

  depends_on "python@3.12"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298/rich-14.3.2.tar.gz"
    sha256 "e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      GeekCode is installed. Run it in any project directory:
        geekcode

      API keys are loaded from environment variables:
        export ANTHROPIC_API_KEY="sk-ant-..."
        export OPENAI_API_KEY="sk-..."

      Free to start — no API key needed with Ollama (local), or get a free key at:
        https://openrouter.ai/settings/keys
    EOS
  end

  test do
    assert_match "geekcode", shell_output("#{bin}/geekcode --help 2>&1", 0)
  end
end

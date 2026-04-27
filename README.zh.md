# Rizum Skills

[English](./README.md) | [中文](./README.zh.md)

Rizum Skills 是一组给 AI 编程助手用的个人规则。

它的目的很简单：让 AI 不要一上来就改代码，而是先看清楚项目、写下分析和计划、边做边更新计划。完整测试默认交给人来跑，AI 只做语法或静态检查，除非你明确要求更多。

主要规则在 [`AGENTS.md`](./AGENTS.md)。`CLAUDE.md` 和 Cursor 相关文件只是为了让不同工具能读到同一套规则。

可安装的 skill 名字是 `rizum-guidelines`。

## 它会做什么

- 改代码前先检查项目里已有的 `analysis.md`、`design.md`、`plan.md`。
- `analysis.md` 用来记录 API 文档、参考实现代码、技术实现分析。
- `design.md` 用来记录 UI、交互、用户体验、用户可感知行为。
- 要求 `design.md` 开头先写清楚项目目标。
- `plan.md` 要有大方向，每个大方向下面再放具体实现步骤。
- 文档保持有用就好，不要每个很小的细节都更新。
- 默认不跑语法、构建或测试命令；只有你要求，或者 debug 反馈需要时才跑。
- 需要你测试的时候，会给出小白也能照做的测试步骤。
- 文件内容用英文，聊天里的总结用中文。

## 安装全局规则

先 clone 仓库：

```bash
git clone https://github.com/Rizumu85/rizum-skills.git ~/rizum-skills
cd ~/rizum-skills
```

运行安装脚本：

```bash
./install.sh
```

它会把规则链接到：

- Claude Code：`~/.claude/CLAUDE.md`
- Codex CLI/Desktop：`~/.codex/AGENTS.md`

Cursor 不支持这种全局文件链接，所以安装脚本会把规则复制到剪贴板。你需要手动粘贴到 Cursor 的 User Rules。

## 安装 Codex Skill

如果你希望 Codex Desktop 里能用 `rizum-guidelines` 这个 skill，运行：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --url https://github.com/Rizumu85/rizum-skills/tree/main/skills/rizum-guidelines
```

安装后重启 Codex Desktop。

这个 skill 不会自动触发。需要你明确说：

```text
Use rizum-guidelines for this task.
```

你调用一次之后，agent 应该在项目文档里写一条简短的 working agreement，通常放在 `plan.md`。这样后面的对话就算没有自动重新加载 skill，也可以通过项目文档接上。

## 安装到 Claude

在 Claude 里添加这个 marketplace：

```text
https://github.com/Rizumu85/rizum-skills
```

Claude 里显示的包名应该是：

```text
Rizum skills
```

调用 skill 的名字仍然是：

```text
/rizum-guidelines
```

## 更新

拉取最新版本：

```bash
cd ~/rizum-skills
git pull
```

然后重启读取这些规则的 app。

如果你是用 Codex Desktop skill 方式安装的，需要重新安装，或者把新的 skill 文件复制到：

```text
~/.codex/skills/rizum-guidelines/SKILL.md
```

## 只在某个项目使用

如果你只想让某个项目使用这套规则，把文件复制到那个项目里：

```bash
cp ~/rizum-skills/AGENTS.md /path/to/project/AGENTS.md
cp ~/rizum-skills/CLAUDE.md /path/to/project/CLAUDE.md
```

## 文件结构

```text
rizum-skills/
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── README.zh.md
├── .claude-plugin/
├── skills/rizum-guidelines/SKILL.md
├── install.sh
└── sync.sh
```

## License

MIT

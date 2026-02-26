SKILL_DIR = $(HOME)/.claude/skills

install:
	@mkdir -p $(SKILL_DIR)/devsh
	@cp skills/devsh/SKILL.md $(SKILL_DIR)/devsh/SKILL.md
	@echo "Installed devsh skill to $(SKILL_DIR)/devsh/"

uninstall:
	@rm -rf $(SKILL_DIR)/devsh
	@echo "Removed devsh skill"

.PHONY: install uninstall

# Copyright the regclient contributors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PWD:=$(shell pwd)
VER_BUMP?=$(shell command -v version-bump 2>/dev/null)
VER_BUMP_CONTAINER?=sudobmitch/version-bump:edge
ifeq "$(strip $(VER_BUMP))" ''
	VER_BUMP=docker run --rm \
		-v "$(shell pwd)/:$(shell pwd)/" -w "$(shell pwd)" \
		-u "$(shell id -u):$(shell id -g)" \
		$(VER_BUMP_CONTAINER)
endif
MARKDOWN_LINT_VER?=v0.22.1

.PHONY: .FORCE
.FORCE:

.PHONY: default
default: lint # there is no default build command

.PHONY: lint
lint: lint-md lint-copyright ## Run all linting

.PHONY: lint-copyright
lint-copyright: ## Verify copyright headers in code files
	./scripts/lint-copyright.sh

.PHONY: lint-md
lint-md: .FORCE ## Run linting for markdown
	docker run --rm -v "$(PWD):/workdir:ro" davidanson/markdownlint-cli2:$(MARKDOWN_LINT_VER) \
	  "**/*.md" "#vendor"

.PHONY: util-version-check
util-version-check: ## check all dependencies for updates
	$(VER_BUMP) check

.PHONY: util-version-update
util-version-update: ## update versions on all dependencies
	$(VER_BUMP) update

.PHONY: help
help: # Display help
	@awk -F ':|##' '/^[^\t].+?:.*?##/ { printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF }' $(MAKEFILE_LIST)

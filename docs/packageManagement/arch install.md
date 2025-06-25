# arch install

> Install and link external project(s) to the current project

## Synopsis

```
arch install [<project-specific> ...]
```

## Description

This command downloads a project and any project that it depends on.

A `project` is:

- **a)** a folder recognized as a `arch` project by a `.arch/` folder
- **b)** a (gzipped) tarball containing **(a)**
- **c)** a url that resolves to **(b)**
- **d)** a `<company>@<name>:<version>` that is published on the registry with **(c)**
- **e)** a `<company>@<name>:<tag>` that points to **(d)**
- **f)** a `<company>@<name>` that has a "stable" tag satisfying **(e)**

---

- **`arch install`**

	Install all the dependencies to the local `.arch/` folder.

- **`arch install <folder>`**

	Install a project that is sitting on the filesystem into currents project's `.arch/` folder.

- **`arch install <tarball url>`**

	Fetch the tarball url, and then install it. In order to distinguish between this and other options, the argument must start with `http://` or `https://`.

	Example:

	```
	arch install https://registry.example.com/company/project/v0.1.1
	```

- **`arch install <company>@<name>[:<version>|:<tag>]`**

	Install a project from the registries that matches `<company>@<name>[:<version>|:<tag>]`. If multiple matching entries are found across different repos, the user will be prompted to select one registry manually. Additionally, you may also specify a particular registry source explicitly with a addtional flag:

	- `-r <registry_specific|repo_specific>`: to specific the registry which this project shuold be found.

	[_*Registry & Repository_]()

	Examples:

	```
	arch install company@demo
	arch install company@demo:1.0.0
	arch install company@demo:beta
	arch install company@demo -r my_unofficial
	arch install company@demo -r https://registry.example.com
	```

## Algorithm

Installed projects are stored in a unified location within the system-wide store.
Each project maintains a reference to the actual package via a symlink or pointer inside its local `.arch/projects` folder.

Meanwhile, metadata about the installed projects is recorded and updated in the `.arch/arch-lock.conf` file to ensure consistency and reproducibility.

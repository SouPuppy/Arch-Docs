# arch commit

> Record changes to the project

## Synopsis

```
arch commit "commit message"
```

## Description

Creates a snapshot of the current state of the project, excluding any files or directories specified in the `.ignore` file, and saves it as a new commit along with the provided message. This archived state can later be traced, jumped to, merged, or diverged from.

Example:

```
arch commit "[docs] fix typo in README.md"
```

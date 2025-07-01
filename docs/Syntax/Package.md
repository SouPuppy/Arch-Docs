# Package

A `Package` is a folder-level unit, organizing external dependencies for the current package.



### `.arch-lock`

`.arch-lock` is a file lies in the root of a package, which should specific these 

**Structure**

```
package : {
	comapny: String
	package: String
	tag: String
	dependencies: List PackageName
}
```


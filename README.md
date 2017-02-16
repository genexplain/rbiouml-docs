# rbiouml-docs
Some documentation for BioUML's R package.

## Availability
The package is [available in the CRAN](https://CRAN.R-project.org/package=rbiouml "available in the CRAN") and can be installed using the install.packages method like:

```R
install.packages("rbiouml")
```

It may be necessary to install RCurl beforehand. When properly installed one
can access the functionality after importing the library:


```R
library(rbiouml)
```

There is a package documentation that can be downloaded from the CRAN
[here](https://cran.r-project.org/web/packages/rbiouml/rbiouml.pdf).

## First commands
Here is a first set of commands to explore.

### biouml.login
Firstly, one needs to log into a server to perform analyses using the
*biouml.login* command.


```R
## Placeholders enclosed by <> need to be substituted by actual parameters
biouml.login("<URL>","<username>","<password>")

## The URL argument may look like this: https://platform.genexplain.com
```

### biouml.ls
One can list folders in the platform using the *biouml.ls* command.

```R
## This shows the contents of your Projects folder
biouml.ls("data/Projects")

## This shows the contents of one of the projects, where
## <project folder name> needs to be substituted by an
## actual project name.
biouml.ls("data/Projects/<project folder name>")
```

### biouml.analysis.*
The *biouml.analysis.list* method returns a table with analysis methods.

```R
biouml.analysis.list()
```

An analysis tool is invoked using the *biouml.analysis* method. The parameters
of a tool can be inspected using the *biouml.analysis.parameters* method.
Applying a tool often involves these two methods (note the placeholders <> which need to be substituted):

```R
biouml.analysis.parameters(<specified method>)
biouml.analysis.parameters(<specified method>,list(<tool parameters>))
```
### Example
Performing a functional classification analysis on a gene set may
look like this:

```R
## Let us have data located in a project named My_Project.
my_data <- "data/Projects/My_Project/Data/First_data"

## This will be the path to the result table
my_result <- paste(my_data,"_fc_result",sep="")

## This invokes the functional classification analysis according
## to disease/gene assocations in HumanPSD.
biouml.analysis("Functional classification",
                list(sourcePath = my_data,
                species = "Human (Homo sapiens)",
                bioHub = "PROTEOME(TM) disease",
                outputTable = my_result));
                
## This command loads the result table into an R data frame.
data <- biouml.get(my_result)
```

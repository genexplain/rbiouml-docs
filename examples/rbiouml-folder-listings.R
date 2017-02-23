##
## Demonstrating common locations in the platform workspace and
## how to explore their contents using R
##
## Please specify server, username and password as commandline arguments
##
args <- commandArgs(trailingOnly = TRUE)
gx.server <- args[1]
gx.user   <- args[2]
gx.passwd <- args[3]

## Loading library and login using specified credentials

library(rbiouml)
biouml.login(gx.server, gx.user, gx.passwd)

## Projects

biouml.ls("data/Projects")

## Available databases

biouml.ls("databases")

## Top folders of the GeneWays database

biouml.ls("databases/GeneWays")

## Workflow groups

biouml.ls("analyses/Workflows")

## Workflows in group 'Common'

ws.folder <- "analyses/Workflows"
biouml.ls(paste(ws.folder,"/",biouml.ls(ws.folder)[1],sep=""))

## Top analysis tool folders

biouml.ls("analyses")

## Site analysis tools

biouml.ls("analyses/Methods/Site analysis")

## Top Galaxy tool folders

biouml.ls("analyses/Galaxy")

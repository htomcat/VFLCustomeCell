# VFLCustomeCell

## Overview
If you want to make custome UITableViewCell, you might write programmatically without autolayout or use xib with autolayout.
In this sample I try to write programmatically with autolayout using VFL(Visial Format Language).

## Requirement
Xcode9, Swift4.0

## What is VFL
VFL is an abbreviation of "Visial Format Language".
We can define constraints with a single line code.
VFL is made of ASCII-art formatted string.
The string construct either horizontal or vertical constraint.

## Why use VFL instead of XIB
Xib is suited to simple constraints.
Otherwise it is not suited to complicated constraints.
For exmaple specific constraints change depend on situation
If you use VFL, you can define constraints easily.

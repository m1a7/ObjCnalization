# ObjCnalization

![alt text](https://raw.githubusercontent.com/m1a7/ObjCnalization/master/logo.png)


[![CI Status](http://img.shields.io/travis/m1a7/ObjCnalization.svg?style=flat)](https://travis-ci.org/m1a7/ObjCnalization)
[![Version](https://img.shields.io/cocoapods/v/ObjCnalization.svg?style=flat)](http://cocoapods.org/pods/ObjCnalization)
[![License](https://img.shields.io/cocoapods/l/ObjCnalization.svg?style=flat)](http://cocoapods.org/pods/ObjCnalization)
[![Platform](https://img.shields.io/cocoapods/p/ObjCnalization.svg?style=flat)](http://cocoapods.org/pods/ObjCnalization)

# ObjCnalization
ObjCnalization - This is Objective-C version fraemwork  [Swifternalization](https://github.com/tomkowz/Swifternalization) by [@tomkowz](https://github.com/tomkowz).
It's a library which does localization in ios simple and fast. Now you do not need a standard .xml and .strings files
in their place came .json files.

When I saw this library, I fell in love 😍. <br>
But it was written in swift 👺. <br>
With each new release of swift, you had to rewrite all over again. It's exhausting  😒. <br>
So I decided to write the library in objective-c.  <br>
Because your swift will be broken tomorrow🤣🤣🤣, but objective-c will work a hundred years😎. <br>

![alt text](https://raw.githubusercontent.com/m1a7/ObjCnalization/master/jokeAboutSwift.png)

# Features
- [x] Pluralization support - Without using *stringdict* files
- [x] Length variations support - Supported since iOS 8.0 (instead of iOS 9.0 like system does) and avoids using *stringsdict* files
- [x] Expressions - inequality and regular expressions
- [x] Shared Expressions
- [x] Built-in Expressions
- [x] Works similarly to NSLocalizedString()
- [x] Uses JSON files to minimize boilerplate code
- [x] Support Swift/ObjC versions
- [x] Full documentation

# Table of Contents
- [Introduction](#introduction)
- [Practical Usage Example](#practical-usage-example)
- [Features](#features-1)
	- [Pluralization](#pluralization)
	- [Length variations](#length-variations)
- [Expressions](#expressions)
	- [Inequality Expressions](#inequality-expressions)
	- [Inequality Extended Expressions](#inequality-extended-expressions)
	- [Regex Expressions](#regex-expressions)
	- [Shared Expressions](#shared-expressions)
	- [Built-in Expressions](#built-in-expressions)
- [Getting Started](#getting-started)
	- [Installation](#installation)
	- [Configuration](#configuration)
	- [Creating file with shared expressions](#creating-file-with-shared-expressions)
	- [Creating file with localization per country](#creating-file-with-localization-per-country)
	- [Getting localized string](#getting-localized-string)
- [Things To Do](#things-to-do-in-future-releases)

## Introduction
ObjCnalization helps in localizing apps in a smarter way. It has been created because of necessity to solve Slavic languages internalization problems but it is universal and works with every language very well.

It uses JSON files and expressions that avoid writing code to handle some cases that you have to write when not using this framework. It makes localizing process simpler.

## Practical Usage Example
Description of practical usage example will use things that are covered later in the document so keep reading it to the end and then read about details/features presented here.

### Problem
Let's assume the app supports English and Russian languages. Naturally app contains two *Localizable.strings* files. One is for *Base* localization which contains *English* translation and one is *Russian* language.

App displays label with information which says when object from the backend has been updated for the last time, e.g. "2 minutes ago", "3 hours ago", "1 minute ago", etc.

### Analysis
The label displays number and a hour/minute/second word in singular or plural forms with "ago" suffix. Different languages handles pluralization/cardinal numbering in slight different ways. Here we need to support English and Polish languages.

In English there are just two cases to cover per hour/minute/second word:

- 1 - "one second ago"
- 0, 2, 3... "%d seconds ago"
- Same with minutes and hours.


In Russian it is more tricky because the cardinal numbers are more complicated:

- 1, 21, 31, 41, 51, 61, 71, 81, 101, 1001, …            - "%d секунда назад"
- 2\~4, 22\~24, 32\~34, 42\~44, 52\~54, 62, 102, 1002, … - "%d секунды назад"
- 0, 5~20, 100, 1000, 10000, 100000, 1000000, …         - "%d секунд назад"
- Same logic for minutes and hours.

Following chapters will present solution without and with ObjCnalization framework. Each solution describes Base (English) and Russian localizations.

Here is a table with [Language Plural Rules](http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html) which covers cardinal forms of numbers in many languages - Many language handle plurality in their own way.

### Solution without ObjCnalization (standard solution from apple)

	Localizable.strings (Base)
	--------------------------
  ```javascript
	"one-second" = "1 second ago";
	"many-seconds" = "%d seconds ago";

	"one-minute" = "1 minute ago";    
	"many-minutes" = "%d minutes ago";

	"one-hour" = "1 hour ago";
	"many-hours" = "%d hours ago";
```
	Localizable.strings (Russian)
	-------------------------    	    	
```javascript
  "one-second"   = "%d секунда назад"
	"few-seconds"  = "%d секунды назад"
	"many-seconds" = "%d секунд  назад"    	    	

	"one-minute"   = "%d минута назад"
	"few-minutes"  = "%d минуты назад"
	"many-minutes" = "%d минут  назад" 	    	

	"one-hours"  = "%d час   назад"
	"few-hours"  = "%d часа  назад"
	"many-hours" = "%d часов назад";
 ```
There are 6 cases in English and 9 cases in Russian (and another Slavic languages). Notice that without additional logic we're not able to detect which version of a string for hour/minute/second the app should display. The logic differs among different languages. We would have to add some lines of code that handle the logic for all the languages we're using in the app. What if there are more than 2 languages? Don't even think about it - this might be not so easy.

*The logic is already implemented in ObjCnalization framework and it fits to every language.*

### Solution with ObjCnalization

This is how localizable files will look:


    base.json
    ---------
```javascript

  "time-seconds": {
        "one"  : "%d second ago"
        "other": "%d seconds ago"
    },

    "time-minutes": {
        "one": "%d minute ago"
        "other": "%d minutes ago"
    },

    "time-hours": {
        "one": "%d hours ago"
        "other": "%d hours ago"
    }
```
	ru.json
	-------
  
```javascript  
	"time-seconds": {
		"one"  : "%d секунда назад",
		"few"  : "%d секунды назад",
		"many" : "%d секунд  назад"
	},

	"time-minutes": {
		"one" : "%d минута назад",
		"few" : "%d минуты назад",
		"many": "%d минут  назад"
	},

	"time-hours": {
		"one" : "%d  час   назад",
		"few" : "%d  часа  назад",
		"many": "%d  часов назад"
	}
```
- "one", "few", "many", "other" - those are shared expressions already built into ObjCnalization - covered below.
- You can add own expressions to handle specific cases - covered below.

As mentioned the logic is implemented into framework so if you want to get one of a localized string you have to make a simple call.

```objective-c

  [[ObjCnalization sharedInstance] localizedString:@"time-seconds" andIntVal:60];

```
or with `I18n` *typealias* (*I-18-letters-n, Internalization*):

```objective-c

 [[I18n sharedInstance] localizedString:@"time-seconds" andIntVal:10];

```
The *key* and *intValue* parameters are validated by loaded expressions and proper version of a string is returned - covered below.

## Features

### Pluralization
ObjCnalization drops necessity of using *stringdicts* files like following one to support pluralization in localized strings. Instead of that you can simply define expressions that cover such cases.
```xml
	<plist version="1.0">
	    <dict>
	        <key>%d file(s) remaining</key>
	        <dict>
	            <key>NSStringLocalizedFormatKey</key>
	            <string>%#@files@</string>
	            <key>files</key>
	            <dict>
	                <key>NSStringFormatSpecTypeKey</key>
	                <string>NSStringPluralRuleType</string>
	                <key>NSStringFormatValueTypeKey</key>
	                <string>d</string>
	                <key>one</key>
	                <string>%d file remaining</string>
	                <key>other</key>
	                <string>%d files remaining</string>
	            </dict>
	        </dict>
	    </dict>
	</plist>
```
No more *stringsdict* files!

### Length Variations
iOS 9 provides new way to select proper localized string variation depending on a screen width. It uses *stringsdict* file with *NSStringVariableWidthRuleType* key.

ObjCnalization drops necessity of using such file and it is not necessary to use this new key to use the feature.

**With ObjCnalization this length variations feature is available since iOS 8.0 because the framework has its own implementation of length variations.**

To use length variations feature your translation file should has entries like this:

    base.json
    ---------
```javascript 
    
    "forgot-password": {
    	"@200": "Forgot Password? Help.",
    	"@300": "Forgot Your Password? Use Help.",
    	"@400": "Do not remember Your Password?" Use Help.""
    }
    
```

The number after `@` sign is max width of a screen or bounds that a string fits to. E.g. the second string will be returned if passed fitting width as a paramter is be greater than 200 and less or equal 300.

To get the second localized string the call looks like below:

```objective-c

   [[I18n sharedInstance] localizedString:@"forgot-password" fittingWidth:300];

```

You can mix expressions with length variations. Following example shows it:

    base.json
    ---------
    
```javascript
   
   "car": {
        "ie:x=1": {
            @100: "One car",
            @200: "You've got one car"
        },

        "more": "You've got few cars"
    }
    
```

## Expressions
There are few *expression types*. Every expression type has their own *parser* and *matcher* but they work internally so you don't need to worry about them.

There are 3 types of expressions:

- *inequality* - handles simple inequalities like: *x<3*, *x>10*, *x=5*, *x<=3*, and so on. Work with integer and float numbers.
- *inequality extended* - extended version of *inequality* with syntax like this: *2<x<10*, *4<=x<6*. Work with integer and float numbers.
- *regex* - uses regular expression. This is the most powerful ;)

### Inequality Expressions
It is composed of several elements:

- *ie:* - prefix of *inequality* expression
- *x* - you have to always pass it, this means here is the place for a number that will be matched. Works with Ints and floating point numbers.
- *<, <=, =, >=, >* - use one of inequality signs
- *1, 3, 5, 6, ...* - value to match is the last one in this expression

Example:
```javascript
	"cars": {
		"ie:x=1": "1 car",
		"ie:x=0": "no cars",
		"ie:x>1": "%d cars"
	}
```

### Inequality Extended Expressions
This is extended version of *inequality* expression. It is composed of 2 values, one value "marker" and two inequality signs.

- *iex:* - prefix of *inequality extended* expression
- *x* - place for number that will be matched. Works with Ints and floating point numbers.
- Only *<* and *<=* are accepted.

Expample:
```javascript
	"tomatos": {
		"iex:2<x<10": "%d tomatos is between 2 and 10"
	}
```
### Regex Expressions
This is the most powerful type of expression. It takes regular expression ;)

- *exp:* - prefix of *regex* expression
- *string* - it takes string with regular expression

Example: (police cars in Russian language)
```javascript
  "police-cars": {
            "exp:(^1$)|(^[^1]1$)|(^[1-9][0-9]?[0,2,3,4,5,6,7,8,9]+1$)": "%d полицейское авто",
            "exp:(((?!1).[2-4]{1})$)|(^[2-4]$)": "%d полицейских авто",
            "exp:(.*(?=1).[0-9]$)|(^[05-9]$)|(.*(?!1).[0156789])": "%d полицейских автомобиля"
    }
```
Powerful stuff, isn't it? :>

PS. There is built-in solution for Russian language so you can use it with doing just this:
```javascript
	"police-cars": {
		"one": "%d полицейское авто",
		"few": "%d полицейских авто",
		"many": "%d полицейских автомобиля"
	}
```
This is called *"Shared Built-In Expression"* and is covered below.

### Shared Expressions

Shared expressions are expressions available among all the localization files. They are declared in *expressions.json* file divided by language and you can use them in localization files.

The functionality allows developer to observance of DRY principle and to avoid mistakes that exist because of reapeating the code in many places.

Normally you declare expression like this:

    ...
    "ie:x>1": "Localized String"
    ...

If you want to use the same expression in multiple files there is no necessity to repeat the expression elsewhere. This is even problematic when you decide to improve/change expression to handle another cases you forget about - you would have to change expression in multiple places. Because of that there are Shared Expression. These feature allows you to create expression just in one place and use identifier of it in multiple places where you normally should put this expression.

What you need to do is to create *expressions.json* file with following structure:

```javascript
    {
    	"base": {
    		"one": "ie:x>1"
    	},

    	"ru": {
    		// ... other than "one" because "one" is available here too.
    	}
    }
```
Now in *ru.json*, *en.json* and so on you have to use it as below:

    ...
    "one": "Localized String"
    ...

Before you decide to create your own expression take a look if there is no built-in one with the same name or whether there is such expression but named differently. Maybe you don't need to do this at all and just use it.



### Built-in expressions

Built-in expressions as name suggest are shared expressions built into framework and available to use with zero configuration. They are separated by country and not all country have its own built-in expressions. For now there are e.g. Base built-in expressions and Polish built-in expressions. Base expressions are available in every country and there are very generic to match all countries pluralization/cardinal numbering logic.

List of supported built-in shared expressions:

    Base (English fits to this completely)
    - one - detects if number is equal 1
    - >one - detects if number is greater than 1
    - two - detects if number is equal 2
    - other - detects if number is not 1, so 0, 2, 3 and so on.

    Russian
    - one  - matches 1, 21, 31, 41, 51, 61, 71, 81, 101, 1001, …
    - few  - matches 2~4, 22~24, 32~34, 42~44, 52~54, 62, 102, 1002
    - many - matches 0, 5~20, 100, 1000, 10000, 100000, 100000

As you can see russian has no "one", ">one", etc. because it inherits from Base by default.

## Getting Started
This chapter shows you how to start using Swifternalization and how to intergrate it with your code.

### Installation
It works with iOS 8.0 and newer.

With CocoaPods:

   pod 'ObjCnalization', :git => 'https://github.com/m1a7/ObjCnalization.git'

### Configuration - Optional

Before you get a first localized string you have to configure Swifternalization by passing to it the bundle where localized json files are placed. If you do not call [[ObjCnalization sharedInstance] configure: bundle]; it will use [NSBundle mainBundle] by default internally.

It will get languages from bundle which was used to configure it. So, if it does not translate you string, please make sure that you added Localizations in Project > Info > Localizations section - the same place like for regular localizations.

![alt text](https://raw.githubusercontent.com/m1a7/ObjCnalization/master/addLocalizationInXcodeSettings.png)


### Creating file with Shared Expressions

Shared Expressions must be placed in *expressions.json*. Syntax of a file looks like below:

```javascript
{
    "base": {
        "ten": "ie:x=10",
        ">20": "ie:x>20",
        "custom-pl-few": "exp:(.*(?=1).[0-9]$)|(^[05-9]$)|(.*(?!1).[0156789])"
    },
    
    "ru": {
        "few": "exp:(((?!1).[2-4]{1})$)|(^[2-4]$)",
        "two": "ie:x=2",
        "three": "ie:x=3",
    }
}
```

In pseudo-language:

```javascript
    {
    	"language-1": {
    		"shared-expression-key-1": "expression-1",
    		"shared-expression-key-2": "expression-2"
    	},

    	"language-2": {
    		"shared-expression-key-1": "expression-1"
    	}
    }
```

Expressions from the files may be used inside localizable files. All the shared expressions for different languages are placed in the same file because there will be just few expressions for every language. Mostly the expression will be defined in *base* variant because if expression is in *base* it is also available in every other language too. So, "ten" is available in "ru", but "three" is not available in "base".

### Creating file with localization per country

Localizable file contains translations for specific language. The files might look like below:

```javascript
	{
	    "welcome-key": "welcome",

	    "cars": {
	        "one": "one car",
	        "ie:x>=2": "%d cars",
	        "ie:x<=-2": "minus %d cars"
	    }
	}
```
Name of a file should be the same like country code. e.g. for English it is *en.json*, for Russian it is *ru.json*, for base localization it is *base.json*, etc.

There are few things that you can place in such files. More complex file will look like below:

```javascript
	{
		"welcome": "welcome",

		"cars": {
			"one": {
				"@100": "one car",
				"@200": "You have one car",
				"@400": "You have got one car"
			},

			"other": "%d cars"
		}
	}
```
In pseudo-language:

```javascript
	{
		"key": "value",

		"key": {
			"expression-1": {
				"length-variation-1": "value-1",
				"length-variation-2": "value-2",
				"length-variation-3": "value-3"
			},

			"expression-2": "value"
		}
	}
```
### Getting localized string

ObjCnalization allows you to work with its one class methods which exposes all the methods you need to localize an app.

These methods have many optional paramters and you can omit them if you want. There are few common parameters:

- `key` - A key of localized string.
- `fittingWidth` - A width of a screen or place where you want to put a localized string. It is integer.
- `defaultValue` - A value that will be returned if there is no localized string for a key passed to the method. If this is not specified then `key` is returned.
- `comment` - A comment used just by developer to know a context of translation.

Examples:
```objectivec
     [[I18n sharedInstance] localizedString:@"welcome"];
     [[I18n sharedInstance] localizedString:@"welcome" andFittWidth:300];
     [[I18n sharedInstance] localizedString:@"welcome" andDefaultVal:@"Welcome" andComment:@"Displayed on app start"];
```
   or
   ```objectivec
       [[I18n sharedInstance] locStr:@"welcome"];
   ```
   or very short syntax
   ```objectivec
        [[I18n call] locStr:@"welcome"];
   ```
   
Next method (and it different short variations)
```objectivec
 - (NSString*) localizedString:(NSString*) key
                     andIntVal:(NSInteger) intValue
                  andFittWidth:(NSInteger) fittingWidth
                 andDefaultVal:(NSString*) defaultValue
                    andComment:(NSString*) comment;
```                 
                   
allows you to get a localized string for string value that match an expression. Actually the string value will contain number inside in most cases or some other string that you would like to match.

```objectivec
   [[I18n call] localizedString:@"cars" andStringVal:@"5" andFittWidth:0 andDefaultVal:@"Car" andComment:@"Car localizate"];
   // Other cases similar to above example
```
The last method (and it different short variations)

```objectivec
   - (NSString*) localizedString:(NSString*) key
                       andIntVal:(NSInteger) intValue
                    andFittWidth:(NSInteger) fittingWidth
                   andDefaultVal:(NSString*) defaultValue
                      andComment:(NSString*) comment
```
allows you to get a localized string for int value. This method calls the above one and just turn the int value into string because all the framework operates on strings.

```objectivec
    [[I18n call] localizedString:@"cars" andIntVal:5];
```
## Author

thisismymail03@gmail.com

## Things to do in future releases
- Add more built-in expressions for another countries.
- Add a method to change the language on your preferred location. Without restarting the application and change the language in iphone

## License

ObjCnalization is available under the MIT license. See the LICENSE file for more info.

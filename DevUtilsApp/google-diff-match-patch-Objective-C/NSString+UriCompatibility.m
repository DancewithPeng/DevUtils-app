/*
 * Diff Match and Patch
 *
 * Copyright 2010 geheimwerk.de.
 * http://code.google.com/p/google-diff-match-patch/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: fraser@google.com (Neil Fraser)
 * ObjC port: jan@geheimwerk.de (Jan Weiß)
 */

#import "NSString+UriCompatibility.h"
#import "JXArcCompatibilityMacros.h"


@implementation NSString (UriCompatibility)

/**
 * Escape excluding selected chars for compatability with JavaScript's encodeURI.
 * This method produces uppercase hex.
 *
 * @param str The CFStringRef to escape.
 * @return The escaped CFStringRef.
 */
- (NSString *)diff_stringByAddingPercentEscapesForEncodeUriCompatibility;
{
  NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@" !~*'();/?:@&=+$,#"];
  return [self stringByAddingPercentEncodingWithAllowedCharacters:charSet];
}

/**
 * Unescape all percent escapes.
 *
 * Example: "%3f" -> "?", "%24" -> "$", etc.
 *
 * @return The unescaped NSString.
 */
- (NSString *)diff_stringByReplacingPercentEscapesForEncodeUriCompatibility;
{
  NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@""];
  return [self stringByAddingPercentEncodingWithAllowedCharacters:charSet];
//  CFStringRef decodedString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
//                                            JX_BRIDGED_CAST(CFStringRef, self), 
//                                            CFSTR(""), 
//                                            kCFStringEncodingUTF8);
//  return JX_TRANSFER_CF_TO_OBJC(NSString *, decodedString);
}

@end

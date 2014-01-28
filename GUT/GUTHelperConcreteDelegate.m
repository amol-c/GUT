//
//  GUTHelperConcreteDelegate.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTHelperConcreteDelegate.h"
#import "GUTAppDelegate.h"

@implementation GUTHelperConcreteDelegate

-(NSString*)runCommand:(NSString *)commandToRun;
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];
    
    NSArray *arguments = [NSArray arrayWithObjects:
                          @"-c" ,
                          [NSString stringWithFormat:@"%@", commandToRun],
                          nil];
    NSLog(@"run command: %@",commandToRun);
    [task setArguments: arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *output;
    output = [[[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return output;
}


-(void)openDocumentWindow:(void (^)(NSString* urlName ,NSArray *urlArray))blockName{
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    GUTAppDelegate *appDelegate =(GUTAppDelegate*)[NSApp delegate];
    NSWindow* window = [appDelegate window] ;

    
    panel.canChooseDirectories=YES;
    panel.canChooseFiles=NO;
    [panel setMessage:@"Import GIT repository"];

   
    // Display the panel attached to the document's window.
    [panel beginSheetModalForWindow:window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL* theDir = [[panel URLs] objectAtIndex:0];
            NSString *path =[[theDir relativeString] stringByReplacingOccurrencesOfString:@"file://" withString:@""];
            if ([path isEqualToString:@""]) {
                NSArray *urlArray=[panel URLs];
                blockName(path,urlArray);
            }else{
                blockName(path,nil);
            }

            // Use the URLs to build a list of items to import.
        }
        
    }];
}

-(void)alertWithMessage:(NSString*)message{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:message];
    [alert addButtonWithTitle:@"OK"];
    [alert runModal];
}

-(NSString*)formatGitOutputConsoleForString:(NSString*)stringToFormat{
    return [stringToFormat stringByReplacingOccurrencesOfString:@"#" withString:@"\n#"];
}



@end

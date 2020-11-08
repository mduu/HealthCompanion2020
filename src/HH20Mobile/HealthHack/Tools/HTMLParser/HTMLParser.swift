//
//  HTMLParser.swift
//  Helsana
//
//  Created by Norbert Sroczyński on 12.04.2017.
//  Copyright © 2017 Helsana Versicherungen AG. All rights reserved.
//

import UIKit

final class HTMLParser {
    static private let style =
    """
    
    <head>
    <link rel='stylesheet' type='text/css' href='style.css'>
    </head>
    <style>
    body {
        font-family: 'Akkurat';
        font-size: %@px;
        color: %@;
        line-height: %@px;
    }
    b, strong {
        font-family: 'Akkurat-Bold';
    }
    h1 {
        font-family: 'Akkurat';
        font-size: %@px;
    }
    li {
        margin: 10px 0;
    }
    a {
        color: %@;
    }

    tr td {
        font-size: 20px;
    }

    </style>
    """
    
    static func attributedString(fromHTML html: String, textColor: UIColor = .textSecondary(), normalFontSize: UInt = 16, headlineFontSize: UInt = 18, centered: Bool = true, lineSpace: UInt? = nil, completion: @escaping (_ result: NSAttributedString?) -> ()) {
        DispatchQueue.main.async {
            completion(attributedString(fromHTML: html, textColor: textColor, normalFontSize: normalFontSize, headlineFontSize: headlineFontSize, centered: centered, lineSpace: lineSpace))
        }
    }
    
    // Use only on main thread
    static func attributedString(fromHTML html: String, textColor: UIColor = .textSecondary(), normalFontSize: UInt = 16, headlineFontSize: UInt = 16, centered: Bool = false, lineSpace: UInt? = nil) -> NSAttributedString? {
        
        let htmlString = centered ? "<body><center>" + html + "</center></body>" : "<body>" + html + "</body>"
        let styleWrappedHTMLString = self.wrapWithStyle(fromHtmlString: htmlString, textColor: textColor, normalFontSize: normalFontSize, headlineFontSize: headlineFontSize, lineSpace: lineSpace)
        guard let data = styleWrappedHTMLString.data(using: String.Encoding.utf16, allowLossyConversion: false) else {
            return nil
        }
        
        do {
            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            return attributedString
        } catch {
            return nil
        }
    }
    
    private static func wrapWithStyle(fromHtmlString html: String, textColor: UIColor = UIColor.textSecondary(), normalFontSize: UInt = 16, headlineFontSize: UInt = 16, lineSpace: UInt? = nil) -> String {
        let style = getStyle(textColor: textColor, normalFontSize: normalFontSize, headlineFontSize: headlineFontSize, lineSpace: lineSpace)
        return String(format: "\(style) %@", html)
    }
    
    private static func getStyle(textColor: UIColor = UIColor.textSecondary(), normalFontSize: UInt = 16, headlineFontSize: UInt = 16, lineSpace: UInt? = nil) -> String {
        let lineSpace = lineSpace ?? self.lineSpace(for: normalFontSize)
        return String(format: self.style, String(normalFontSize), textColor.hex(), String(lineSpace), String(headlineFontSize), textColor.hex())
    }
    
    private static func lineSpace(for fontSize: UInt) -> UInt {
        // LineSpace should depend on fontSize
        // Defined by Design: (fontSize/lineSpacing) 12/14  -- 14/20 — 16/24 — 20/28 — 24/32 — 28/34 — 32/40
        
        if fontSize <= 12 {
            return 14
        }
        else if fontSize <= 14 {
            return 20
        }
        else if fontSize <= 16 {
            return 24
        }
        else if fontSize <= 20 {
            return 28
        }
        else if fontSize <= 24 {
            return 32
        }
        else if fontSize <= 28 {
            return 34
        }
        else {
            return 40
        }
    }
}




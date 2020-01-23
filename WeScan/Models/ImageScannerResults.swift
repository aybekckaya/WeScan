//
//  ImageScannerResults.swift
//  WeScan
//
//  Created by aybek can kaya on 23.01.2020.
//  Copyright © 2020 WeTransfer. All rights reserved.
//

import Foundation


/// Data structure containing information about a scanning session.
/// Includes the original scan, cropped scan, detected rectangle, and whether the user selected the enhanced scan. May also include an enhanced scan if no errors were encountered.
public struct ImageScannerResults {
    
    /// The original scan taken by the user, prior to the cropping applied by WeScan.
    public var originalScan: ImageScannerScan
    
    /// The deskewed and cropped scan using the detected rectangle, without any filters.
    public var croppedScan: ImageScannerScan
    
    /// The enhanced scan, passed through an Adaptive Thresholding function. This image will always be grayscale and may not always be available.
    public var enhancedScan: ImageScannerScan?
    
    /// Whether the user selected the enhanced scan or not.
    /// The `enhancedScan` may still be available even if it has not been selected by the user.
    public var doesUserPreferEnhancedScan: Bool
    
    /// The detected rectangle which was used to generate the `scannedImage`.
    public var detectedRectangle: Quadrilateral
    
    @available(*, unavailable, renamed: "originalScan")
    public var originalImage: UIImage?
    
    @available(*, unavailable, renamed: "croppedScan")
    public var scannedImage: UIImage?
    
    @available(*, unavailable, renamed: "enhancedScan")
    public var enhancedImage: UIImage?
    
    @available(*, unavailable, renamed: "doesUserPreferEnhancedScan")
    public var doesUserPreferEnhancedImage: Bool = false
    
    init(detectedRectangle: Quadrilateral, originalScan: ImageScannerScan, croppedScan: ImageScannerScan, enhancedScan: ImageScannerScan?, doesUserPreferEnhancedScan: Bool = false) {
        self.detectedRectangle = detectedRectangle
        
        self.originalScan = originalScan
        self.croppedScan = croppedScan
        self.enhancedScan = enhancedScan
        
        self.doesUserPreferEnhancedScan = doesUserPreferEnhancedScan
    }
}

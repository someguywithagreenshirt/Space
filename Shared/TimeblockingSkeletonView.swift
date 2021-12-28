//
//  TimeblockingSkeletonView.swift
//  Space
//
//  Created by Richard Campbell on 12/27/21.
//

import SwiftUI

struct TimeblockingSkeletonView: View {
    var body: some View {
        ZStack {
            HStack {
                // Stack of 18 timeblocks
                VStack {
                    EmptyView()
                }
            }
        }
    }
}

// This will be used by both Skeleton and Meat
// Skeleton will have faded content
// Meat will have the real deal layed on top of Skeleton
extension TimeblockingSkeletonView {
    struct Ghost: View {
        var body: some View {
            EmptyView()
        }
    }
}

extension TimeblockingSkeletonView {
    struct Skeleton: View {
        var body: some View {
            EmptyView()
        }
    }
}

extension TimeblockingSkeletonView {
    struct Meat: View {
        var body: some View {
            EmptyView()
        }
    }
}

struct TimeblockingSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        TimeblockingSkeletonView()
    }
}

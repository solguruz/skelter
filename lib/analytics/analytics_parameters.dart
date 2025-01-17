class AnalyticsParameters {
  static const String kStatus = 'status';
  static const String kOk = 'ok';
  static const String kRejected = 'rejected';
  static const String kPassFail = 'passFail';
  static const String kAction = 'action';
  static const String kIsSuccessful = 'isSuccessful';
  static const String kPostVisibilityAccess = 'postVisibilityAccess';
  static const String kCommentVisibilityAccess = 'commentVisibilityAccess';
  static const String kCommentPostingAccess = 'commentPostingAccess';
  static const String kRepostAccess = 'repostAccess';
  static const String kParentPostId = 'parentPostId';
  static const String kTextPostCount = 'textPostCount';
  static const String kImagePostCount = 'imagePostCount';
  static const String kVideoPostCount = 'videoPostCount';
  static const String kIsStory = 'isStory';
  static const String kType = 'type';
  static const String kWhatFailed = 'whatFailed';
  static const String kManualReview = 'manualReview';
  static const String kAttempts = 'attempts';
  static const String kFaceMatchResult = 'faceMatchResults';
  static const String kQuery = 'query';
  static const String kFollower = 'follower';
  static const String kFollowing = 'following';
  static const String kFeedPostType = 'feedPostType';
  static const String kFeedScopeType = 'feedScopeType';
  static const String kCommunityId = 'communityId';
  static const String kUserId = 'userId';
  static const String kPostId = 'postId';
  static const String kReportType = 'reportType';
  static const String kCommentId = 'commentId';
  static const String kCommenterId = 'commenterId';
  static const String kReplyId = 'replyId';
  static const String kReactionType = 'reactionType';
  static const String kSearchType = 'searchType';
  static const String kCount = 'count';
  static const String kCode = 'code';
  static const String kHandle = 'handle';
  static const String kVerb = 'verb';
  static const String kNegativeConfidenceCount = 'negativeConfidenceCount';
  static const String kShouldBypassTrollDetection =
      'shouldBypassTrollDetection';
  static const String kBrightness = 'brightness';
  static const String kMarketing = 'marketing';
  static const String kRouteName = 'routeName';
  static const String kFlagCommentOperation = 'flagCommentOperation';
  static const String kCommenterBlockOperation = 'commenterBlockOperation';
  static const String kChallengeId = 'challengeId';
  static const String kReferralCode = 'referralCode';
  static const String kReferralName = 'referralName';
  static const String kReferralSource = 'referralSource';
  static const String kReferralSourceId = 'referralSourceId';
  static const String kReferrerHandle = 'referrerHandle';
  static const String kReferrerId = 'referrerId';
  static const String kRetryCount = 'retryCount';
  static const String kExceptionName = 'exceptionName';
  static const String kWillRetry = 'willRetry';
  static const String kToggleCleanMode = 'toggleCleanMode';
  static const String kIsEnabled = 'isEnabled';
  static const String kImageUrl = 'imageUrl';
  static const String kOriginalImageUrl = 'originalImageUrl';
  static const String kInviteCode = 'inviteCode';
  static const String kInviteActionName = 'inviteActionName';
  static const String kUserListType = 'userListType';
  static const String kPhoneNumber = 'phoneNumber';
  static const String kDebugGetIdTokenCaller = 'debugGetIdTokenCaller';
  static const String kIsConnected = 'isConnected';
  static const String kIsAuthenticated = 'isAuthenticated';
  static const String kDebugStackTrace = 'debugStackTrace';
  static const String kErrorMessage = 'errorMessage';
  static const String kAuthorId = 'authorId';
  static const String kBannerId = 'bannerId';
  static const String kCaller = 'caller';
  static const String kAwaitedSecs = 'awaitedSecs';
  static const String kImagePickerScreen = 'imagePickerScreen';
  static const String kImagePickerSource = 'imagePickerSource';
  static const String kOperationName = 'operationName';
  static const String kHighlightPostInput = 'highlightPostInput';
  static const String kCondenseArticleOriginalUrl =
      'condenseArticleOriginalUrl';
}

class LoginAnalyticsParams extends AnalyticsParameters {
  static const String kOtpVerificationId = 'otpVerificationId';
  static const String kSmsCodeLen = 'smsCodeLen';
  static const kIsFromVerificationPage = 'isFromVerificationPage';
  static const kVerificationId = 'verificationId';
}

class TokenExpirationParams extends AnalyticsParameters {
  static const String kExpiryInMins = 'expiryInMins';
  static const String kExpiryTimeInUtc = 'expiryTimeInUtc';
}

class LoginSignupV2AnalyticsParams extends AnalyticsParameters {
  static const String kIsValid = 'isValid';
  static const String kHasFocus = 'hasFocus';
  static const String kCountryCode = 'countryCode';
  static const String kPhoneNumber = 'phoneNumber';
  static const String kErrorMessage = 'errorMessage';
  static const String kPhoneOtpText = 'phoneOtpText';
  static const String kIsResendOTPEnabled = 'isResendOTPEnabled';
  static const String kResentOTPTimeLeft = 'resentOTPTimeLeft';
  static const String kVerificationId = 'verificationId';
  static const String kResendToken = 'resendToken';
  static const String kIsFromVerificationPage = 'isFromVerificationPage';
  static const String kOtpCode = 'otpCode';
  static const String kEmail = 'email';
  static const String kPassword = 'password';
  static const String kIsPasswordVisible = 'isPasswordVisible';
  static const String kIsLoading = 'isLoading';
  static const String kIsSignup = 'isSignup';
  static const String kHandleName = 'handleName';
  static const String kHandleNameStatus = 'handleNameStatus';
  static const String kShowSuffix = 'showSuffix';
  static const String kIsDoneEditing = 'isDoneEditing';
  static const String kProfilePicturePath = 'profilePicturePath';
  static const String kLoginSignupType = 'loginSignupType';
  static const String kConfirmPassword = 'confirmPassword';
  static const String kIsConfirmPasswordVisible = 'isConfirmPasswordVisible';
  static const String kPasswordStrengthLevel = 'passwordStrengthLevel';
  static const String kResendTimeLeft = 'resendTimeLeft';
}

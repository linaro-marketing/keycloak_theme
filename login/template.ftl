<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <link href="https://www.linaro.org/assets/css/main.css" rel="stylesheet"/>
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>
<body class="${properties.kcBodyClass!}">
<div id="wrapper">
  <div class="${properties.kcLoginClass!}">
    <nav class="navbar navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
            <a class="navbar-left" href="https://www.linaro.org">
                <img  src="https://www.linaro.org/assets/images/content/Linaro-Logo.svg"/>
            </a>
            </div>
        </div><!--/.container-fluid -->
    </nav>
    <#--  <div id="kc-header" class="${properties.kcHeaderClass!}">
      <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</div>
    </div>  -->
    <div class="container-fluid">
    <div class="row" id="login_form_row">
    <div class="container">
      <header class="${properties.kcFormHeaderClass!}">
        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div id="kc-locale">
                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                    <div class="kc-dropdown" id="kc-locale-dropdown">
                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                        <ul>
                            <#list locale.supported as l>
                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </#if>
        <h1 id="kc-page-title"><#nested "header"></h1>
      </header>
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                  <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                  <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                  <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
        </div>
      </div>
    </div>
    </div>
  </div>

    <footer id="footer">
        <div class="container-fluid">
            <div class="row" id="block_row">
                <div class="container">
                    <div class="row row_equal_height">
                    <div class="col-xs-12 col-sm-4">
                        <div class="block">
                            <h3>Need an account?</h3>
                             <p>
                                If you are an employee of a Linaro member company you can submit a request for a new account to be created for you.
                            </p>
                            <a href="https://servicedesk.linaro.org/servicedesk/customer/portal/3/create/120" class="btn btn-primary btn-lg">Request an account <i class="pficon-user"></i></a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="block">
                            <h3>Get Help</h3>
                             <p>
                                If you have questions, please raise a support ticket on Linaro's Service Desk.
                            </p>
                            <a href="https://servicedesk.linaro.org" class="btn btn-primary btn-lg">Go to Service Desk <i class="pficon-unknown"></i></a>
                        </div>
                    </div>
                     <div class="col-xs-12 col-sm-4">
                        <div class="block">
                            <h3>About Linaro</h3>
                            <p>
                                If you are new to Linaro, register now for access to product evaluations and purchasing capabilities.
                            </p>
                            <a href="https://www.linaro.org/about/" class="btn btn-primary btn-lg">About Us <i class="pficon-info"></i></a>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row footer-bottom p-t-20 p-b-20">
                <div class="container">
                    <div class="col-xs-12 text-white text-center"> Copyright &copy; <script type="text/javascript">var d = new Date(); var year = d.getFullYear(); document.write(year);</script> Linaro Limited <span class="coloured-bp">&bull;</span> <a href="https://www.linaro.org/legal/">Legal</a> <span class="coloured-bp">&bull;</span> <a href="https://www.linaro.org/contact/">Contact</a> <span class="coloured-bp">&bull;</span> <a href="https://www.linaro.org/press/">Press</a> </div>
                    <div class="col-xs-12 text-white text-center m-t-10">
                        <a href="https://www.linaro.org"> <img src="https://www.linaro.org/assets/images/Linaro-logo-white.png" class="footer-logo" alt="Linaro Logo White Footer Icon" /> </a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>
</#macro>

<!-- BEGIN: main -->
<link type="text/css" href="{NV_STATIC_URL}themes/default/images/{MODULE_FILE}/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link type="text/css" href="{NV_STATIC_URL}themes/default/images/{MODULE_FILE}/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
<script type="text/javascript" src="{NV_STATIC_URL}themes/default/images/{MODULE_FILE}/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="{NV_STATIC_URL}themes/default/images/{MODULE_FILE}/bootstrap-datepicker/locales/bootstrap-datepicker.{NV_LANG_INTERFACE}.min.js"></script>
<link rel="stylesheet" href="{ASSETS_STATIC_URL}/js/select2/select2.min.css">
<script src="{ASSETS_STATIC_URL}/js/select2/select2.min.js"></script>
<!-- BEGIN: error -->
<div class="alert alert-danger">{ERROR}</div>
<!-- END: error -->
<div class="row">
        <form method="get" action="{NV_BASE_ADMINURL}index.php">
            <input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}">
            <input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="element_q">{LANG.search_keywords}</label>
                        <input type="text" class="form-control" id="element_q" name="q" value="{SEARCH.q}" placeholder="{LANG.search_keywords}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="element_q">{LANG.belong_cat}</label>
                        <select class="form-control" id="element_catids" name="catids" value="{SEARCH.catids}" placeholder="{LANG.search_keywords}">
                            <option value="0">{LANG.please_select}</option>
                            <!-- BEGIN: cat -->
                            <option value="{CAT.id}"{CAT.selected}>{CAT.title}</option>
                            <!-- END: cat -->
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="element_q">{LANG.belong_author}</label>
                        <select class="form-control"  name="author_id" value="{SEARCH.author_id}" placeholder="{LANG.search_keywords}">
                            <option value="0">{LANG.please_select}</option>
                            <!-- BEGIN: author -->
                            <option value="{AUTHOR.id}"{AUTHOR.selected}>{AUTHOR.name_author}</option>
                            <!-- END: author -->
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="element_q">{LANG.belong_tag}:</label>
                        <select class="form-control"  name="tagids"  placeholder="{LANG.search_keywords}">
                            <option value="0">{LANG.please_select}</option>
                            <!-- BEGIN: tag -->
                            <option value="{TAG.id}"{TAG.selected}>{TAG.title}</option>
                            <!-- END: tag -->
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="element_from">{LANG.from_day}:</label>
                        <input type="text" class="form-control datepicker" id="element_from" name="f" value="{SEARCH.from}" placeholder="dd-mm-yyyy" autocomplete="off">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="element_to">{LANG.to_day}:</label>
                        <input type="text" class="form-control datepicker" id="element_to" name="t" value="{SEARCH.to}" placeholder="dd-mm-yyyy" autocomplete="off">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit"><i class="fa fa-search" aria-hidden="true"></i> {GLANG.search}</button>
                        <a href="{LINK_ADD_NEW}" class="btn btn-success"><i class="fa fa-plus-circle" aria-hidden="true"></i> {LANG.content}</a>
                        <a href="{LINK_IMPORT}" class="btn btn-default"><i class="fa fa-cloud-upload" aria-hidden="true"></i> {LANG.import}</a>
                    </div>
                </div>
            </div>
        </form>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $('.datepicker').datepicker({
        language: '{NV_LANG_INTERFACE}',
        format: 'dd-mm-yyyy',
        weekStart: 1,
        todayBtn: 'linked',
        autoclose: true,
        todayHighlight: true,
        zIndexOffset: 1000
    });
});
</script>
<form>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th style="width: 1%" class="text-center">
                        <input name="check_all[]" type="checkbox" value="yes" onclick="nv_checkAll(this.form, 'idcheck[]', 'check_all[]',this.checked);">
                    </th>
                    <th style="width: 20%" class="text-nowrap">
                        <a href="{URL_ORDER_CONTENT}">{ICON_ORDER_TITLE} {LANG.title}</a>
                    <th style="width: 15%" class="text-nowrap">{LANG.name_author}</th>
                    <th style="width: 15%" class="text-nowrap">{LANG.cats_title}</th>
                    <th style="width: 15%" class="text-nowrap">{LANG.name_tags}<th
                    <th style="width: 15%" class="text-nowrap">
                        <a href="{URL_ORDER_ADDTIME}">{ICON_ORDER_ADD_TIME} {LANG.addtime}</a>
                    </th>
                    <th style="width: 15%" class="text-nowrap">
                        <a href="{URL_ORDER_UPDATETIME}">{ICON_ORDER_EDIT_TIME} {LANG.edittime}</a>
                    </th>
                    <th style="width: 15%" class="text-nowrap text-center">{LANG.status}</th>
                    <th style="width: 14%" class="text-nowrap text-center">{LANG.function}</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <td class="text-center">
                        <input type="checkbox" onclick="nv_UncheckAll(this.form, 'idcheck[]', 'check_all[]', this.checked);" value="{ROW.id}" name="idcheck[]">
                    </td>
                    <td>
                        <div style="margin-bottom: 5px !important;">
                            <span class="label label-info">{ROW.keywords}</span>
                        </div>
                        <a href="#md-content-{ROW.id}" data-toggle="modal">{ROW.title}</a>
                        <div class="modal fade" tabindex="-1" role="dialog" id="md-content-{ROW.id}">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        {ROW.content}
                                    </div>
                                    <div class="modal-footer">
                                        <div class="text-center">
                                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times text-danger"></i> {LANG.close}</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="text-nowrap">{ROW.name_author}</td>
                    <td class="text-nowrap">{ROW.name_cat}</td>
                    <td class="text-nowrap">{ROW.name_tags}</td>
                    <td class="text-nowrap">{ROW.addtime}</td>
                    <td class="text-nowrap">{ROW.updatetime}</td>
                    <td class="text-center">
                        <input name="status" id="change_status{ROW.id}" value="1" type="checkbox"{ROW.status_render} onclick="nv_change_content_status('{ROW.id}', '{NV_CHECK_SESSION}');">
                    </td>
                    <td class="text-center text-nowrap">
                        <a href="{ROW.url_edit}" class="btn btn-xs btn-default"><i class="fa fa-edit"></i> {GLANG.edit}</a>
                        <a href="javascript:void(0);" onclick="nv_delele_content('{ROW.id}', '{NV_CHECK_SESSION}');" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i> {GLANG.delete}</a>
                    </td>
                </tr>
                <!-- END: loop -->
            </tbody>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td colspan="6">
                        {GENERATE_PAGE}
                    </td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
        </table>
    </div>
    <div class="form-group form-inline">
        <div class="form-group">
            <select class="form-control" id="action-of-content">
                <option value="delete">{GLANG.delete}</option>
            </select>
        </div>
        <button type="button" class="btn btn-primary" onclick="nv_content_action(this.form, '{NV_CHECK_SESSION}', '{LANG.msgnocheck}')">{GLANG.submit}</button>
    </div>
</form>
<script>
    $(document).ready(function() {
        $('select').select2();
    });
</script>
<!-- END: main -->

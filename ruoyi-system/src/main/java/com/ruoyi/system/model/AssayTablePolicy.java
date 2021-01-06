package com.ruoyi.system.model;

import com.deepoove.poi.data.RowRenderData;
import com.deepoove.poi.policy.DynamicTableRenderPolicy;
import com.deepoove.poi.policy.MiniTableRenderPolicy;
import com.deepoove.poi.util.TableTools;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import java.util.List;

public class AssayTablePolicy extends DynamicTableRenderPolicy {
    // 化验结果数据所在行数
    int assayRow = 6;
    @Override
    public void render(XWPFTable table, Object data) {
        if (null == data) return;
        AssayData assayData = (AssayData) data;

        // 化验结果明细
        List<RowRenderData> assayResult = assayData.getAssayResult();
        if (null != assayResult) {
            table.removeRow(assayRow);
            int size = assayResult.size()-1;
            for (int i = size; i >=0; i--) {

                XWPFTableRow insertNewTableRow = table.insertNewTableRow(assayRow);
                for (int j = 0; j < 10; j++) insertNewTableRow.createCell();

                // 合并单元格
                TableTools.mergeCellsHorizonal(table, assayRow, 3, 5);
                TableTools.mergeCellsHorizonal(table, assayRow, 4, 6);
                // 渲染单行货品明细数据
                MiniTableRenderPolicy.Helper.renderRow(table, assayRow, assayResult.get(i));
            }
        };
    }
}
